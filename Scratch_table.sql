
-- 1. Creating "Scratch_table" table in the database

CREATE TABLE scratch_table(
	patient_id INT PRIMARY KEY,
	Name VARCHAR(50),
	Age INT,
	Gender VARCHAR(100),
	Blood_Type VARCHAR(100),
	Medical_Condition VARCHAR(100),
	Admission_id INT,
	Date_of_Admission VARCHAR(100),
	Doctor VARCHAR(100),
	Hospital VARCHAR(100),
	Insurance_Provider	VARCHAR(100),
	Billing_Amount NUMERIC(10,2),
	Room_Number INT,
	Admission_Type VARCHAR(100),
	Discharge_Date VARCHAR(100),
	Medication VARCHAR(100),
	Test_Results VARCHAR(100)
);

