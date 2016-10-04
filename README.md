- No end-point for retrieving messages sent to an email
- Mailgun already has unit tests for initialization and such. Can't really write any tests without them being forced.

- ruby -r "./mailer.rb" -e "Mailer.check_suppressions('email')" to check if email is listed in a suppression
- ruby -r "./mailer.rb" -e "Mailer.send_email('email')" to send email with subject campaign_id and text. Can be viewed at http://bin.mailgun.net/d82eaee5 as they are in sandbox/test mode
- webhooks for click at http://bin.mailgun.net/800f6deb
- webhooks for open at http://bin.mailgun.net/ab6210ed
