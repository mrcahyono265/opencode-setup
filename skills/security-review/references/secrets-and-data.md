# Secrets & Sensitive Data

Use this reference when the task touches credentials, tokens, personal data, payment data, logs, storage, or external service configuration.

## Check

- Secrets are not committed to source control.
- Client-side code does not receive server-only secrets.
- Logs do not expose credentials or unnecessary sensitive data.
- Error responses do not leak internal details or protected records.
- Environment variables and secret stores are used appropriately.
- Access to sensitive files and storage objects follows the same authorization boundary as the application resource.
- Test fixtures do not contain real client credentials or unnecessary personal data.
