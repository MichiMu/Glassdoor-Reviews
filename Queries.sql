USE glassdoor_reviews;

-- Compare the experiences per company and add the percentage amounts to compare
SELECT company_name,
       COUNT(*) AS total_count,
       SUM(CASE WHEN experience = 'Positive' THEN 1 ELSE 0 END) AS total_positive_experience,  
       SUM(CASE WHEN experience = 'Negative' THEN 1 ELSE 0 END) AS total_negative_experience,
       SUM(CASE WHEN experience = 'Neutral' THEN 1 ELSE 0 END) AS total_neutral_experience,
       ROUND(100 * SUM(CASE WHEN experience = 'Positive' THEN 1 ELSE 0 END) / COUNT(*), 0) AS positive_percentage,
       ROUND(100 * SUM(CASE WHEN experience = 'Negative' THEN 1 ELSE 0 END) / COUNT(*), 0) AS negative_percentage,
       ROUND(100 * SUM(CASE WHEN experience = 'Neutral' THEN 1 ELSE 0 END) / COUNT(*), 0) AS neutral_percentage
FROM all_data
GROUP BY company_name;

-- Compare experiences in Deliverect per section
SELECT section,
       COUNT(*) AS total_count,
       SUM(CASE WHEN experience = 'Positive' THEN 1 ELSE 0 END) AS total_positive_experience,
       SUM(CASE WHEN experience = 'Negative' THEN 1 ELSE 0 END) AS total_negative_experience,
       SUM(CASE WHEN experience = 'Neutral' THEN 1 ELSE 0 END) AS total_neutral_experience
FROM all_data
WHERE company_name = 'Deliverect'
GROUP BY section;

-- Compare experiences in Lightspeed per section
SELECT section,
       COUNT(*) AS total_count,
       SUM(CASE WHEN experience = 'Positive' THEN 1 ELSE 0 END) AS total_positive_experience,
       SUM(CASE WHEN experience = 'Negative' THEN 1 ELSE 0 END) AS total_negative_experience,
       SUM(CASE WHEN experience = 'Neutral' THEN 1 ELSE 0 END) AS total_neutral_experience
FROM all_data
WHERE company_name = 'Lightspeed'
GROUP BY section;

-- Comparison of experiences per section, in percentage, between Lightspeed and Deliverect
SELECT company_name, section,
       COUNT(*) AS total_count,
       ROUND(100 * SUM(CASE WHEN experience = 'Positive' THEN 1 ELSE 0 END) / COUNT(*), 0) AS positive_percentage,
       ROUND(100 * SUM(CASE WHEN experience = 'Negative' THEN 1 ELSE 0 END) / COUNT(*), 0) AS negative_percentage,
       ROUND(100 * SUM(CASE WHEN experience = 'Neutral' THEN 1 ELSE 0 END) / COUNT(*), 0) AS neutral_percentage
FROM all_data
GROUP BY section, company_name
ORDER BY section;

-- Comparison of experiences per department, in percentage, between Lightspeed and Deliverect
SELECT company_name, department,
       COUNT(*) AS total_count,
       ROUND(100 * SUM(CASE WHEN experience = 'Positive' THEN 1 ELSE 0 END) / COUNT(*), 0) AS positive_percentage,
       ROUND(100 * SUM(CASE WHEN experience = 'Negative' THEN 1 ELSE 0 END) / COUNT(*), 0) AS negative_percentage,
       ROUND(100 * SUM(CASE WHEN experience = 'Neutral' THEN 1 ELSE 0 END) / COUNT(*), 0) AS neutral_percentage
FROM all_data
GROUP BY department, company_name
ORDER BY department;