--5. What is the trend of phishing emails over time?
SELECT 
	date AS date_sent,
	COUNT(*) AS total_emails
FROM
	public.fraud_data
GROUP BY
	date
ORDER BY 
	total_emails DESC
LIMIT 10;
