---
title: Phishing Emails Analysis.
---

Phishing is the practice of sending fraudulent communications that appear to come from a legitimate and reputable source, usually through email and text messaging. The attacker's goal is to steal money, gain access to sensitive data and login information, or to install malware on the victim's device. Phishing is a dangerous, damaging, and an increasingly common type of cyberattack.


```sql total
SELECT COUNT(*)
FROM phishing_emails.information_schema.fraud_data
```

```sql all
SELECT
    * 
FROM 
    phishing_emails.fraud_data
LIMIT 20
```


```sql senders
SELECT 
	sender_email,
	COUNT(*) as total_sent
FROM 
	phishing_emails.fraud_data
GROUP BY 
	sender_email
ORDER BY 
	total_sent DESC
```

<BarChart 
    data={senders}
    x=sender_email
    y=total_sent
    series=sender_email
    title="mo"
/>




## What's Next?
- [Connect your data sources](settings)
- Edit/add markdown files in the `pages` folder
- Deploy your project with [Evidence Cloud](https://evidence.dev/cloud)

## Get Support
- Message us on [Slack](https://slack.evidence.dev/)
- Read the [Docs](https://docs.evidence.dev/)
- Open an issue on [Github](https://github.com/evidence-dev/evidence)
