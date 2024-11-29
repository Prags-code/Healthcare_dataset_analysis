
-- 4. Key Health Statistics Overview and Observation

-- The largest insurance provider nationwide.
SELECT Insurance_Provider, COUNT(*) AS Provider_Count
FROM Hospital
GROUP BY Insurance_Provider
ORDER BY Insurance_Provider DESC LIMIT 1;

-- ANSWER --> The largest insurance provider nationwide is UnitedHealthcare with a count of 8051.

-- Which gender is most commonly affected by cancer?

SELECT Gender,Medical_Condition, COUNT(*) AS Count_of_Patient
FROM Patient
GROUP BY Gender, Medical_Condition
HAVING Medical_Condition='Cancer'
ORDER BY Gender;

-- ANSWER --> The gender that is most commonly affected by cancer is FEMALE WITH COUNT OF 3383.

-- Number of cancer patients whose test results show as normal.

SELECT p.Medical_Condition, hi.Test_Results, COUNT(*) AS Total_Count
FROM HospitalandInsurance hi
JOIN patient p 
ON p.Name = hi.Name
WHERE p.Medical_Condition = 'Cancer' AND hi.Test_Results = 'Normal'
GROUP BY Medical_Condition, Test_Results

-- ANSWER --> Total 2208 patients with cancer gets test results as normal.

-- Age group exhibiting the highest rates of obesity.(Add an age group column).

ALTER TABLE Patient ADD COLUMN Age_group VARCHAR(100);
UPDATE Patient
SET Age_group = CASE
	WHEN Age BETWEEN 0 AND 10 THEN '0-10'
	WHEN Age BETWEEN 11 AND 20 THEN '11-20'
	WHEN Age BETWEEN 21 AND 30 THEN '21-30'
	WHEN Age BETWEEN 31 AND 40 THEN '31-40'
	WHEN Age BETWEEN 41 AND 50 THEN '41-50'
	WHEN Age BETWEEN 51 AND 60 THEN '51-60'
	WHEN Age BETWEEN 61 AND 70 THEN '61-70'
	ELSE 'Above 70' 
END;

SELECT Medical_Condition, Age_group, COUNT(*) AS Count_of_Patient
FROM Patient
GROUP BY Medical_Condition, Age_group
HAVING Medical_Condition='Obesity'
ORDER BY Count_of_Patient DESC LIMIT 1;

-- ANSWER --> Patient with age above 70 exhibits the highest rate of Obesity.

-- Blood type most associated with diabetes.

SELECT Blood_Type, Medical_Condition, COUNT(*) AS Count_of_Patient
FROM Patient
GROUP BY Blood_Type, Medical_Condition
HAVING Medical_Condition='Diabetes'
ORDER BY Count_of_Patient DESC LIMIT 5;

-- ANSWER --> Blood type B+ is mostly associated with diabetes with count of 859.
