
-- 3. Based on star schema

-- Dimension table

CREATE TABLE Patient(
	patient_id INT PRIMARY KEY,
	Name VARCHAR(50),
	Age INT,
	Gender VARCHAR(100),
	Blood_Type VARCHAR(100),
	Medical_Condition VARCHAR(100)
);

-- Fact table 

CREATE TABLE Hospital(
	Admission_id INT PRIMARY KEY,
	patient_id INT,
	Date_of_Admission DATE,
	Doctor VARCHAR(100),
	Hospital VARCHAR(100),
	Insurance_Provider VARCHAR(100),
	Billing_Amount numeric(10,2),
	Room_Number INT,
	Admission_Type varchar(100),
	Discharge_Date varchar(100),
	FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE MedicationsAndTestResults(
	Admission_id INT,
	Medication VARCHAR(100),
	Test_Results VARCHAR(100),
	FOREIGN KEY (Admission_id) REFERENCES Hospital(Admission_id)
);

-- Inserting data into tables from scratch table

INSERT INTO Patient(patient_id,Name,Age,Gender,Blood_Type,Medical_Condition)
SELECT patient_id,Name,Age,Gender,Blood_Type,Medical_Condition
FROM scratch_table;

INSERT INTO Hospital(Admission_id,patient_id,Date_of_Admission,Doctor,
					Hospital,Insurance_Provider,Billing_Amount,
					Room_Number,Admission_Type,Discharge_Date)
SELECT Admission_id,patient_id,Date_of_Admission,Doctor,
					Hospital,Insurance_Provider,Billing_Amount,
					Room_Number,Admission_Type,Discharge_Date
FROM scratch_table;


INSERT INTO MedicationsAndTestResults(Admission_id, Medication, Test_Results)
SELECT Admission_id, Medication, Test_Results
FROM scratch_table;


-- Fact table creation with the help of JION COMMAND

CREATE TABLE HospitalandInsurance AS
SELECT h.Admission_id, p.Name,m.Test_Results 
FROM Hospital h
JOIN MedicationsAndTestResults m ON h.Admission_id=m.Admission_id
JOIN Patient p ON h.patient_id=p.patient_id;

Select * from MedicationsAndTestResults;

