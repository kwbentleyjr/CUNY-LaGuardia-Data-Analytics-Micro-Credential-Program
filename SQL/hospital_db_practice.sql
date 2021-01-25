SELECT * FROM department;
SELECT * FROM physician;
SELECT * FROM affiliated_with;
SELECT * FROM patient;
SELECT * FROM nurse;
SELECT * FROM appointment;

--find general medicine doctors name

SELECT physician.name, affiliated_with.department, department.name
FROM affiliated_with
INNER JOIN department ON affiliated_with.department=department.departmentID
INNER JOIN physician ON affiliated_with.physician=physician.employeeid
WHERE affiliated_with.department=1;

--find which patient-doctor visit

SELECT 
	patient.name AS Patient, 
	physician.name AS Physician, 
	appointment.startdate AS date
FROM appointment
INNER JOIN physician ON appointment.physician=physician.employeeid
INNER JOIN patient ON appointment.patient=patient.ssn;

--find room details

SELECT * FROM room;
SELECT COUNT(unavailable) FROM room WHERE unavailable=True GROUP BY unavailable;

--total patient count on blockcode=2

SELECT COUNT(*) FROM room WHERE blockcode=2;

--check procedure details

SELECT * FROM undergoes;

--find hospital workload such as procedure time and doctors, nurse details

SELECT 
	physician.name AS doctor_name, 
	nurse.name AS nurse_name,
	undergoes.dateundergoes AS procedure_time
FROM undergoes
INNER JOIN physician ON undergoes.physician=physician.employeeid
LEFT JOIN nurse ON undergoes.assistingnurse=nurse.employeeid
WHERE physician=3;

--patient medication and prescription details

SELECT * FROM medication;

SELECT 
	patient.name, 
	prescribes.dose, 
	medication.name, 
	medication.brand
FROM prescribes
INNER JOIN medication ON prescribes.medication=medication.code
INNER JOIN patient ON prescribes.patient=patient.ssn;

--trained in procedures

SELECT * FROM procedures;
SELECT * FROM trained_in;

SELECT treatment, count(treatment) FROM trained_in GROUP BY treatment;

SELECT procedures.name, COUNT(trained_in.treatment), physician.name
FROM trained_in
INNER JOIN procedures ON trained_in.treatment=procedures.code
INNER JOIN physician ON trained_in.physician=physician.employeeid
GROUP BY trained_in.treatment, physician.name, procedures.name
ORDER BY trained_in.treatment;


