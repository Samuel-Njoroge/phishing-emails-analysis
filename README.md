# Phishing Emails Analysis.
Phishing is the practice of sending fraudulent communications that appear to come from a legitimate and reputable source, usually through email and text messaging. The attacker's goal is to steal money, gain access to sensitive data and login information, or to install malware on the victim's device. Phishing is a dangerous, damaging, and an increasingly common type of cyberattack.

[Source](https://www.cisco.com/c/en/us/products/security/email-security/what-is-phishing.html)

This project involves an analysis on emails classified as 'phishing'.

Data source : https://www.kaggle.com/datasets/naserabdullahalam/phishing-email-dataset

**Reference**

*Al-Subaiey, A., Al-Thani, M., Alam, N. A., Antora, K. F., Khandakar, A., & Zaman, S. A. U. (2024, May 19). Novel Interpretable and Robust Web-based AI Platform for Phishing Email Detection. ArXiv.org. https://arxiv.org/abs/2405.11619*

## Project Architecture.
![phishing_emails](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/1b7f4044-cdf6-4764-b1b4-a44f3f6e7bab)

### 1. What is the total observations in the phishing emails dataset?.

```sh
SELECT 
	COUNT(*) AS total_observations 
FROM 
	public.fraud_data;
```

### 2. Which emails are most frequently associated with phishing?

```sh
SELECT 
	sender_email,
	COUNT(*) as total_sent
FROM 
	public.fraud_data
GROUP BY 
	sender_email
ORDER BY 
	total_sent DESC;
```

### 3. Who are the most frequently associated with phishing emails?

```sh
SELECT 
	sender_name,
	COUNT(*) as total 
FROM 
	public.fraud_data
GROUP BY 
	sender_name
ORDER BY 
	total DESC;
```

### 4. Who are the most frequently targeted by phishing emails?

```sh
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

```
### 5. What is the trend of phishing emails over time?

```sh
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
```

### 6. Are there specific days or times when phishing emails are more likely to be sent?

```sh
SELECT
	TO_CHAR(date, 'Day') AS day_of_week,
	COUNT(*) AS total_sent
FROM
	public.fraud_data
GROUP BY
	day_of_week
ORDER BY
	total_sent DESC;
```

### 7. What are the most frequently used words as the subject in phishing emails?

```sh
SELECT 
	subject
FROM
	public.fraud_data
WHERE 	
	subject LIKE '%Important%' OR
	subject LIKE '%Money%' OR
	subject LIKE '%Urgent%' OR
	subject LIKE '%action%';
```

### 8. What are the sender-receiver pairs that occur most frequently?

```sh
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
```

### 9. What is the most prone target time of the day?

```sh
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
	total DESC;
```

### 10. What is the most frequent target time and day? 

```sh
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
```
