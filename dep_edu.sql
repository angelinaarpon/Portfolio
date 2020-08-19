--1

SELECT
	COLUMN_NAME, data_type
FROM
  	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'naep'
	
-- 2

SELECT *
FROM naep
LIMIT 50;

-- 3

SELECT state, MIN(avg_math_4_score), MAX(avg_math_4_score), AVG(avg_math_4_score), COUNT(avg_math_4_score)
FROM naep
GROUP BY state
ORDER BY state;

-- 4

SELECT state, MAX(avg_math_4_score), MIN(avg_math_4_score), AVG(avg_math_4_score), COUNT(avg_math_4_score)
FROM naep
GROUP BY state
HAVING (MAX(avg_math_4_score) - MIN(avg_math_4_score)) > 30;

-- 5

SELECT state AS bottom_10_states, ROUND(avg_math_4_score, 2) AS avg_score
FROM naep
WHERE year = 2000 AND avg_math_4_score IS NOT NULL
ORDER BY avg_score DESC
LIMIT 10;
 
-- 6

SELECT state, ROUND(AVG(avg_math_4_score), 2) AS avg_score
FROM naep
WHERE year = 2000
GROUP BY state;

-- 7

SELECT state AS below_average_states_y2000, ROUND(avg_math_4_score, 2) AS avg_score
FROM naep
WHERE year = 2000
AND avg_math_4_score < (SELECT AVG(avg_math_4_score) FROM naep WHERE year = 2000)
ORDER BY avg_score;

-- 8

SELECT state, AVG(avg_math_4_score) AS scores_missing_y2000
FROM naep
WHERE year = 2000
GROUP BY state
HAVING AVG(avg_math_4_score) IS NULL;

-- 9 

SELECT f.state, ROUND(n.avg_math_4_score, 2), f.total_expenditure
FROM naep AS n
LEFT OUTER JOIN finance as f
ON n.id = f.id
WHERE n.year = 2000
AND n.avg_math_4_score IS NOT NULL
ORDER BY f.total_expenditure DESC;



