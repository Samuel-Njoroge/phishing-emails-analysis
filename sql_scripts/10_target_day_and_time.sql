--10. What is the most frequent target time and day?
SELECT 
	EXTRACT(HOUR FROM time) AS hour_of_day,
	TO_CHAR(date, 'Day') AS day_of_week,
	COUNT(*) AS total
FROM
	public.fraud_data
GROUP BY
	hour_of_day,
	date
ORDER BY 
	total DESC 
LIMIT 10;
