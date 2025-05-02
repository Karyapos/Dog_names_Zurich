SELECT subq.dog_name,subq.female,subq.male,
SUM(subq.female+subq.male) AS total_freq FROM 
(SELECT dog_name,
COUNT(CASE WHEN dog_sex= 'Female' THEN 1 END)AS Female,
COUNT(CASE WHEN dog_sex= 'Male' THEN 1 END) AS Male 
FROM dog
GROUP BY dog_name
ORDER BY Female DESC , Male
LIMIT 100) AS subq
GROUP BY subq.dog_name,subq.female,subq.male
ORDER BY total_freq DESC
;