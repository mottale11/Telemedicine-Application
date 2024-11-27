const db = require('../config/db');
const bcrypt = require('bcryptjs');

exports.register = async (req, res) => {
    const { first_name, last_name, email, password, phone, date_of_birth, gender, address } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);

    try {
        await db.query(
            'INSERT INTO Patients (first_name, last_name, email, password_hash, phone, date_of_birth, gender, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [first_name, last_name, email, hashedPassword, phone, date_of_birth, gender, address]
        );
        res.status(201).send('Patient registered successfully');
    } catch (error) {
        res.status(500).send(error.message);
    }
};
