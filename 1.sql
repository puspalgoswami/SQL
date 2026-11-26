CREATE DATABASE HospitalDB;

USE HospitalDB;

-- 1. Create Department Table
CREATE TABLE Department (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(50),
    location VARCHAR(50)
);

-- 2. Create Doctor Table
CREATE TABLE Doctor (
    dr_id INT PRIMARY KEY,
    dr_name VARCHAR(50),
    speciality VARCHAR(50),
    sal DECIMAL(10,2),
    d_id INT,
    FOREIGN KEY (d_id) REFERENCES Department(d_id)
);

-- 3. Create Patient Table
CREATE TABLE Patient (
    pt_id INT PRIMARY KEY,
    pt_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

-- 4. Create Appointment Table
CREATE TABLE Appointment (
    ap_id INT PRIMARY KEY,
    ap_date DATE,
    fee DECIMAL(10,2),
    status VARCHAR(20),
    dr_id INT,
    pt_id INT,
    FOREIGN KEY (dr_id) REFERENCES Doctor(dr_id),
    FOREIGN KEY (pt_id) REFERENCES Patient(pt_id)
);

-- 5. Insert Department Records (5 Tuples)
INSERT INTO Department VALUES
(101, 'Cardiology', 'Block A'),
(102, 'Neurology', 'Block B'),
(103, 'Orthopedics', 'Block C'),
(104, 'Dermatology', 'Block D'),
(105, 'Pediatrics', 'Block E);

-- 6. Insert Doctor Records (8 Tuples)
INSERT INTO Doctor VALUES
(201, 'Dr. Arindam Sen', 'Cardiologist', 85000, 101),
(202, 'Dr. Priya Das', 'Neurologist', 90000, 102),
(203, 'Dr. Rahul Roy', 'Orthopedic', 75000, 103),
(204, 'Dr. Sneha Ghosh', 'Dermatologist', 70000, 104),
(205, 'Dr. Amit Sharma', 'Pediatrician', 65000, 105),
(206, 'Dr. Ananya Bose', 'Cardiologist', 80000, 101),
(207, 'Dr. Kunal Dey', 'Neurologist', 82000, 102),
(208, 'Dr. Meera Paul', 'Orthopedic', 78000, 103);

-- 7. Insert Patient Records (8 Tuples)
INSERT INTO Patient VALUES
(301, 'Rahul Mukherjee', 25, 'Male', 'Kolkata'),
(302, 'Priya Sharma', 32, 'Female', 'Howrah'),
(303, 'Amit Das', 45, 'Male', 'Kalyani'),
(304, 'Sneha Roy', 21, 'Female', 'Chakdaha'),
(305, 'Suman Ghosh', 60, 'Male', 'Bardhaman'),
(306, 'Riya Banerjee', 28, 'Female', 'Salt Lake'),
(307, 'Arjun Paul', 35, 'Male', 'Newtown'),
(308, 'Neha Dutta', 12, 'Female', 'Krishnanagar');

-- 8. Insert Appointment Records (10 Tuples)
INSERT INTO Appointment VALUES
(401, '2026-11-26', 800, 'Completed', 201, 301),
(402, '2026-11-26', 1000, 'Pending', 202, 302),
(403, '2026-11-27', 700, 'Completed', 203, 303),
(404, '2026-11-27', 600, 'Pending', 204, 304),
(405, '2026-11-28', 500, 'Completed', 205, 305),
(406, '2026-11-28', 900, 'Pending', 206, 306),
(407, '2026-11-29', 1000, 'Completed', 207, 307),
(408, '2026-11-29', 750, 'Pending', 208, 308),
(409, '2026-11-30', 800, 'Completed', 201, 302),
(410, '2026-12-01', 950, 'Pending', 202, 301);

-- 9. Display All Records
SELECT * FROM Department;

SELECT * FROM Doctor;

SELECT * FROM Patient;

SELECT * FROM Appointment;

-- 10. JOIN Query
SELECT
    p.pt_name,
    d.dr_name,
    d.speciality,
    dep.d_name AS department,
    a.ap_date,
    a.fee,
    a.status
FROM Appointment a
JOIN Patient p
    ON a.pt_id = p.pt_id
JOIN Doctor d
    ON a.dr_id = d.dr_id
JOIN Department dep
    ON d.d_id = dep.d_id;
