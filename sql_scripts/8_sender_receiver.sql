--8. What are the sender-receiver pairs that occur most frequently?
SELECT 
	sender_email,
	receiver_email,
	COUNT(*) AS total
FROM
	public.fraud_data
GROUP BY
	sender_email,
	receiver_email
ORDER BY
	total DESC
LIMIT 10;