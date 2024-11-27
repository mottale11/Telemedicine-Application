const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-section');
require('dotenv').config();

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true
}));

const patientRoutes = require('./routes/patients');
const doctorRoutes = require('./routes/doctor');
const appointmentRoutes = require('./routes/appointment');
const adminRoutes = require('./routes/admin');

app.use('/patients', patientRoutes);
app.use('/doctor',doctorRoutes);
app.use('/appointment', appointmentRoutes);
app.use('/admin',adminRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});