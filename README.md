# SMTP Test Script
This Bash script is designed to send test emails using multiple SMTP servers and configurations stored in a file (smtp_info.txt). It sends test emails from the sender's email address to specified recipients using the swaks utility.

## Features
- Step 1: Sends a test email from all servers listed in smtp_info.txt to a specific recipient.
- Step 2: Sends an email from a defined main server to all email addresses listed in smtp_info.txt.
- Uses TLS for secure email transmission.
- Compatible with both port 587 and port 465 for SMTP communication.

## Requirements
- swaks (Swiss Army Knife SMTP) should be installed on your system. You can install it via:
- bash
- Copy code
- sudo apt install swaks

## Configuration
- SMTP Info File (smtp_info.txt):

You need to create a file named smtp_info.txt that contains email addresses, SMTP server names, and passwords for each server, separated by spaces. The format should look like this:

```
admin@server1.com smtp.server1.com password1
admin@server2.com smtp.server2.com password2
```
Each line corresponds to one server's SMTP details.

## Script Variables:

- Modify the following variables in the script as per your environment:

- FROM_EMAIL: The email address from which the test email will be sent in Step 2.
- FROM_NAME: The name displayed in the "From" field of the email.
- SMTP_SERVER: The main SMTP server for Step 2 (e.g., mail.domain.com.tr).
- PASSWORD: The password for the main SMTP server.
- PORT: The port for SMTP (default is 587, but can be set to 465 for SSL).

## Recipient:

- In Step 1, all emails are sent to the TO_EMAIL address, which is set in the script (test@gmail.com by default). You can change this email address as needed.

## Usage
Ensure that you have the necessary permissions to execute the script:
```
chmod +x smtp_test.sh
```

Run the script:
```
./smtp_test.sh
```

- Step 1: Sends test emails to TO_EMAIL from all servers listed in smtp_info.txt.
- Step 2: Sends emails from the main SMTP server (mail.domain.com.tr) to all recipients listed in smtp_info.txt.
***
Example Output
When the script runs, you will see output similar to the following:


1. Adım: Test e-postasını göndermek için tüm sunucuları kontrol ediyorum...
Mail gönderiliyor: test@gmail.com (smtp.server1.com) Port: 587
Mail gönderiliyor: test@gmail.com (smtp.server2.com) Port: 587

2. Adım: Tüm sunuculara `mail.domain.com.tr` sunucusundan e-posta gönderiyorum...
Mail gönderiliyor: admin@server1.com (mail.domain.com.tr) Port: 587
Mail gönderiliyor: admin@server2.com (mail.domain.com.tr) Port: 587
Notes
Ensure that SMTP access is allowed for the email addresses and servers used in the script.
Adjust the port (587 or 465) based on your SMTP server's configuration.
For debugging purposes, the swaks output can help verify SMTP connections and authentication.

***
