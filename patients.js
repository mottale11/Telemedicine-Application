const express = require('express');
const router = express.Router();
const patientsController = require('../controllers/patientsController');

router.post('/register', patientsController.register);
router.post('/login', patientsController.login);
router.get('/profile', authenticateSession, patientsController.getProfile);
router.put('/profile', authenticateSession, patientsController.updateProfile);

module.exports = router;
