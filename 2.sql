-- a) Department name, number of doctors and total appointments
SELECT d.dept_name,
       COUNT(DISTINCT doc.doctor_id) AS total_doctors,
       COUNT(a.appointment_id) AS total_appointments
FROM department d
LEFT JOIN doctor doc ON d.dept_id = doc.dept_id
LEFT JOIN appointment a ON doc.doctor_id = a.doctor_id
GROUP BY d.dept_id, d.dept_name;

-- b) Each doctor's name with number of appointments
SELECT doc.doctor_name,
       COUNT(a.appointment_id) AS total_appointments
FROM doctor doc
LEFT JOIN appointment a ON doc.doctor_id = a.doctor_id
GROUP BY doc.doctor_id, doc.doctor_name;

-- c) Patients whose age is above average age
SELECT patient_name, age
FROM patient
WHERE age > (SELECT AVG(age) FROM patient);

-- d) Each doctor's name with number of distinct patients treated
SELECT doc.doctor_name,
       COUNT(DISTINCT a.patient_id) AS total_patients
FROM doctor doc
LEFT JOIN appointment a ON doc.doctor_id = a.doctor_id
GROUP BY doc.doctor_id, doc.doctor_name;

-- e) Patients who have no appointments
SELECT p.patient_id, p.patient_name
FROM patient p
WHERE p.patient_id NOT IN (
    SELECT patient_id FROM appointment
);

-- f) Each patient's name with total appointment fees (0 if none)
SELECT p.patient_name,
       COALESCE(SUM(a.fees), 0) AS total_fees
FROM patient p
LEFT JOIN appointment a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name;

-- g) Highest-paid doctor in each department
SELECT d.dept_name, doc.doctor_name, doc.sal
FROM department d
JOIN doctor doc ON d.dept_id = doc.dept_id
WHERE doc.sal = (
    SELECT MAX(doc2.sal)
    FROM doctor doc2
    WHERE doc2.dept_id = d.dept_id
);
