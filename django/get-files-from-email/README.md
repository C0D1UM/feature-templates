# Description

This is an example for get attachment files from email via IMAP protocol

# Required Packages

1. [imapclient](https://pypi.org/project/IMAPClient/)
1. [mail-parser](https://pypi.org/project/mail-parser/)

# Django Setting

Add this to your setting file (eg. settings.py)

```python
FETCH_EMAIL_HOST = env.str(var='FETCH_EMAIL_HOST', default='outlook.office365.com')
FETCH_EMAIL_PORT = env.int(var='FETCH_EMAIL_PORT', default=993)
FETCH_EMAIL_USER = env.str(var='FETCH_EMAIL_HOST', default='a@a.com')
FETCH_EMAIL_PASSWORD = env.str(var='FETCH_EMAIL_PASSWORD', default='P@ssw0rd')
FETCH_EMAIL_LIMIT = env.int(var='FETCH_EMAIL_LIMIT', default=None)
```
