# Phishing Emails Analysis.
Phishing is the practice of sending fraudulent communications that appear to come from a legitimate and reputable source, usually through email and text messaging. The attacker's goal is to steal money, gain access to sensitive data and login information, or to install malware on the victim's device. Phishing is a dangerous, damaging, and an increasingly common type of cyberattack.

[Source](https://www.cisco.com/c/en/us/products/security/email-security/what-is-phishing.html)

This project involves an analysis on emails classified as 'phishing'.

Data source : https://www.kaggle.com/datasets/naserabdullahalam/phishing-email-dataset

**Data Source Reference**

*Al-Subaiey, A., Al-Thani, M., Alam, N. A., Antora, K. F., Khandakar, A., & Zaman, S. A. U. (2024, May 19). Novel Interpretable and Robust Web-based AI Platform for Phishing Email Detection. ArXiv.org. https://arxiv.org/abs/2405.11619*

## Project Architecture.
![phishing_emails](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/1b7f4044-cdf6-4764-b1b4-a44f3f6e7bab)

## Skills & Tools
- Python - Applied in the whole Data Cleaning process.
- SQL - Applied in the Data Exploration phase.
- Jupyter Notebooks - Used as the Data Cleaning environment.
- PostgreSQL - Used as the Database Management System to handle the data.
  
## Objectives 
- To find out the most frequent emails associated with phishing.
- Identify the frequent targets/prone individuals to phishing.
- Identify the trend of phishing emails over time.
- To find out the most frequent target time and day.
- To identify the sender-receiver pattern in phishing.

### 1. What is the total observations in the phishing emails dataset?.

#### Query

```sh
SELECT 
	COUNT(*) AS total_observations 
FROM 
	public.fraud_data;
```

#### Results

![1](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/a57a5ab4-e9d0-4316-97db-4d1db4e48b6c)

### 2. Which emails are most frequently associated with phishing?

#### Query

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

#### Results

![2](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/dd2bb444-f1e9-4ac9-b085-951d48aef566)

### 3. Who are the most frequently associated with phishing emails?

#### Query

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

#### Results

![3](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/cf0142b1-c1cf-48e9-9b6c-d3272f7f2f34)

### 4. Who are the most frequently targeted by phishing emails?

#### Query

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

#### Results

![4](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/9db0d4e0-aa4f-4efa-bf56-16de450dcdaf)

### 5. What is the trend of phishing emails over time?

#### Query

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

#### Results

![5](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/6a8cffa5-e4b1-44ff-833a-391d2180f7bc)

### 6. Are there specific days or times when phishing emails are more likely to be sent?

#### Query

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

#### Results

![6](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/b0f4a04d-c849-4549-a707-ab8bcee34c77)

### 7. What are the most frequently used words as the subject in phishing emails?

#### Query

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

#### Results

![7](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/1611c860-792b-4d77-abce-c49e65cd508c)

### 8. What are the sender-receiver pairs that occur most frequently?

#### Query

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

#### Results

![8](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/672e584f-fbd0-46d5-ad0f-c5b5562a56e4)

### 9. What is the most prone target time of the day?

#### Query

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

#### Results

![9](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/1b55d9a7-1c0a-444a-95a8-79ce80e33bf1)

### 10. What is the most frequent target time and day? 

#### Query

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

#### Results

![10](https://github.com/Samuel-Njoroge/phishing-emails-analysis/assets/108589210/9328410d-e102-422e-a29d-baa529ef3805)


## Conclusions
-
-
-
-
-

## Recommendations
-
-
-
-
