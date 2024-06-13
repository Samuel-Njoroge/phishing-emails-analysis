--9. What is the most prone target time of the day?--
SELECT 
	CASE 
		WHEN EXTRACT(HOUR FROM time) = 0 THEN '12 AM'
		WHEN EXTRACT(HOUR FROM time) < 12 THEN CONCAT(EXTRACT(HOUR FROM time)::text, ' AM')
		WHEN EXTRACT(HOUR FROM time) = 12 THEN '12 PM'
		ELSE CONCAT((EXTRACT(HOUR FROM time) - 12)::text, ' PM')
	END AS hour_of_day,
	COUNT(*) AS total
FROM
	public.fraud_data
GROUP BY
	hour_of_day
ORDER BY
	total desc
limit 10
