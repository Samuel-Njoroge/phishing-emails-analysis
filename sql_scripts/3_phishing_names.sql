--Which Senders are most frequently associated with phishing emails?--
SELECT 
	sender_name,
	COUNT(*) as total 
FROM 
	public.fraud_data
GROUP BY 
	sender_name
ORDER BY 
	total DESC;