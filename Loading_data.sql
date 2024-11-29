
-- 2. Load the data from file to table, using copy command
-- To use the copy command, connect the psql  shell with the db. Write the copy command on shell

\COPY scratch_table FROM '/Users/pragatijha/Upgrad python notes/SQL/Healthcare Project/healthcare_dataset.csv' DELIMITER ',' CSV HEADER;

-- `Note`: file path is irrespective of the slash

-- Column name data type modification string into date type:

ALTER TABLE scratch_table
ALTER COLUMN Date_of_Admission TYPE DATE
USING TO_DATE(Date_of_Admission, 'MM/DD/YYYY');

ALTER TABLE scratch_table
ALTER COLUMN Discharge_Date TYPE DATE
USING TO_DATE(Discharge_Date,'MM/DD/YYYY');
