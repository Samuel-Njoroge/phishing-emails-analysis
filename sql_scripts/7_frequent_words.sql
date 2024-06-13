--7. What are the most frequently used words in the subject of phishing emails?
SELECT 
	subject
FROM
	public.fraud_data
WHERE 	
	subject LIKE '%Important%' OR
	subject LIKE '%Money%' OR
	subject LIKE '%Urgent%' OR
	subject LIKE '%action%' 
limit 10;