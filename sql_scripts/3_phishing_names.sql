--Which Senders are most frequently associated with phishing emails?--
SELECT 
	sender_name,
	COUNT(*) as total 
FROM 
	public.fraud_data
where sender_name != 'Unknown' and sender_name != ''
GROUP BY 
	sender_name
ORDER BY 
	total DESC;