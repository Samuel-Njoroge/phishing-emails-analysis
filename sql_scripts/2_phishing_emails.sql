--Which emails are most frequently associated with phishing?--
SELECT 
	sender_email,
	COUNT(*) as total_sent
FROM 
	public.fraud_data
GROUP BY 
	sender_email
ORDER BY 
	total_sent DESC;