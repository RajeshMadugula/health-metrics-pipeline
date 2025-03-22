-- 1. Average Blood Pressure by Age Group
SELECT Age, 
    AVG(Diastolic_Blood_Pressure) AS Avg_Diastolic_BP, 
    AVG(Systolic_Blood_Pressure) AS Avg_Systolic_BP 
FROM processed_glucose 
GROUP BY Age 
ORDER BY Age;

-- 2. Heart Disease Risk by Cholesterol Levels
SELECT 
    CASE 
        WHEN chol < 200 THEN 'Low'
        WHEN chol BETWEEN 200 AND 239 THEN 'Borderline High'
        ELSE 'High'
    END AS Cholesterol_Level, 
    COUNT(*) AS Patient_Count, 
    AVG(target) AS Heart_Disease_Risk 
FROM cleaned_heart 
GROUP BY Cholesterol_Level;

-- 3. Sleep Quality and Stress Correlation
SELECT Stress_Level, AVG(Quality_of_Sleep) AS Avg_Sleep_Quality 
FROM processed_sleep_cycle 
GROUP BY Stress_Level 
ORDER BY Stress_Level;

-- 4. Diabetes Prevalence by Blood Glucose Levels
SELECT CASE 
        WHEN "Blood Glucose Level(BGL)" < 100 THEN 'Normal'
        WHEN "Blood Glucose Level(BGL)" BETWEEN 100 AND 125 THEN 'Prediabetic'
        ELSE 'Diabetic'
    END AS Glucose_Category, 
    COUNT(*) AS Patient_Count, AVG("Diabetic/NonDiabetic (D/N)") AS Diabetes_Risk 
FROM processed_glucose 
GROUP BY Glucose_Category;

-- 5. Impact of Physical Activity on Sleep Disorders
SELECT 
    CASE 
        WHEN Physical_Activity_Level < 30 THEN 'Low Activity'
        WHEN Physical_Activity_Level BETWEEN 30 AND 60 THEN 'Moderate Activity'
        ELSE 'High Activity'
    END AS Activity_Level, COUNT(*) AS Patient_Count, AVG(Sleep_Disorder) AS Avg_Sleep_Disorder_Risk 
FROM processed_sleep_cycle 
GROUP BY Activity_Level;

-- 6. Heart Rate Trends by Age
SELECT Age, AVG(Heart_Rate) AS Avg_Heart_Rate 
FROM processed_glucose 
GROUP BY Age 
ORDER BY Age;

-- 7. Relationship Between BMI and Blood Pressure
SELECT BMI_Category, AVG(CAST(SUBSTRING_INDEX(Blood_Pressure, '/', 1) AS SIGNED)) AS Avg_Systolic_BP, 
    AVG(CAST(SUBSTRING_INDEX(Blood_Pressure, '/', -1) AS SIGNED)) AS Avg_Diastolic_BP 
FROM processed_sleep_cycle 
GROUP BY BMI_Category 
ORDER BY BMI_Category;