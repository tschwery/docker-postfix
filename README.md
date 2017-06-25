# Simple Postfix Docker Container

Simple and light container for a receiving SMTP server without relay capability.

Only configured addresses can receive mail and everything is consolidated into
a single user.

## Environment Variables

- `DOMAIN` - FQDN for the server. Used for the domain part of the accepted emails
- `ACCOUNTS` - Comma-separated list of aliases for the single account

## Volumes

No volumes are defined. If you want persistent spool storage then mount
`/home/smtp/Maildir` outside of the container.

