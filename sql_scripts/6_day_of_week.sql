--6. Are there specific days or times when phishing emails are more likely to be sent?
SELECT
	TO_CHAR(date, 'Day') AS day_of_week,
	COUNT(*) AS total_sent
FROM
	public.fraud_data
GROUP BY
	day_of_week
ORDER BY
	total_sent DESC;