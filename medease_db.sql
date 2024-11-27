-- creating the database
CREATE DATABASE medease_db;
USE medease_db;

-- create patient table
CREATE TABLE  patients(
	   patient_id INT PRIMARY KEY AUTO_INCREMENT,
    firt_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    password_harsh VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address TEXT
);

-- create doctor table
CREATE TABLE doctor(
	doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    firts_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    schedule TEXT
);

-- Create appointment table 
CREATE TABLE appointment(
	appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Schedule', 'Completed', 'Canceled') NOT NULL
);

-- Create admin table
CREATE TABLE admin(
	admin_id INT AUTO_INCREMENT PRIMARY KEY,
    useranme VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Manager') NOT NULL
);


-- Some Sampla Data for Testing
INSERT INTO patients (first_name, last_name, email, password_harsh, phone, date_of_birth, gender, address)
VALUES ('Moses', 'Mwai', 'mosesmwai100@gmail.com', '<hashed_password1!>', '+254769694900', '2024-11-27', 'Male', 'Kitusuru, Nairobi');
