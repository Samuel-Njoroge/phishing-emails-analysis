--4. Which Receivers are most frequently targeted by phishing emails?--
SELECT 
	receiver_email,
	COUNT(*) as total_received
FROM 
	public.fraud_data
WHERE
	receiver_email != 'unknown@example.com'
GROUP BY 
	receiver_email
ORDER BY 
	total_received DESC
LIMIT 10;