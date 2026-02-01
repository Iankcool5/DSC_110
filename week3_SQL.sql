--This code makes a table for patients that will have information on their id, name, age, gender and city
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);
-- This piece of code creates the information that will be used for the table 
INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');


--This line of code generates the table called patient taht has their patient id, name, age, gender, city 
SELECT * FROM patients;
--This line of code generates the table called patient taht has their patient id, name, age, gender, city but only for those who are female 
SELECT * FROM patients
WHERE gender = 'F';
--These lines of code generate the patients but only have their name and age on there 
SELECT Name, Age 
From patients;


--Can you show me all the fields pertaining to the records
-- for patients who are above 40 years? 
-- These lines of code generate a table of the patients with all the information but its for those above the age of 40 
SELECT * FROM patients
where age > 40;
--This line of code shows the of patients that are in the system 
SELECT COUNT(*) FROM patients;

--This line of code shows the number of different cities in the system 
SELECT COUNT(DISTINCT city) FROM patients;
SELECT DISTINCT city FROM patients;

--Average age of the patients
--These lines of code show the average age between the patient, the yougest age, the oldest age and the sum of the ages
SELECT avg(age) FROM patients;
SELECT min(age) from patients;
select max(age) FROM patients;
SELECT sum(age) from patients; 


--Agrigation 
--These lines of code take each gender and calculate the average age between the genders 
select gender, avg(age) Avg_age
From patients
group by gender
Order By 2;

--what is the minimum age for each city?
--These lines of code show the yougest age from each city 
SELECT min(age),city from patients
group by city;
--These lines of code show the the oldest age from each city 
select city, max(age) Max_age
From Patients
Group by city
order by 1 DESC;
--These lines of code create a table called vistis that will show the visit id, patient id, visit date, diagnosis, and cost of visit
CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
-- These lines of code have the information that will be used for the table
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);
--This line of code generates the table with the information 
select * from visits; 

--These lines of code generate the table showing only the patient id, visit id, diagnosis, and city. These lines are taking information from the patient table and the visit table.
SELECT p.patient_id, visit_id, diagnosis, city
From patients p LEFT join visits v
on p.patient_id = v.patient_id;


-- Give me the average cost of visits per city? 
--These lines of code generates a table that shows the average cost of visits per city
SELECT avg(cost), city
From patients p Join visits v 
On p.patient_id = v.patient_id
Group By city;
