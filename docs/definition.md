<!-- Auto-generated from schema-map.psd1 @ 6cefe8e (2025-10-22T20:27:41+02:00) -->
# Definition – payment_gateway_notifications

Inbound notifications from payment gateways (webhooks, IPNs).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| transaction_id | VARCHAR(255) | YES | — | Gateway transaction id (unique if provided). |  |
| received_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | When we received the notification (UTC). |  |
| processing_by | VARCHAR(100) | YES | — | Worker name processing the event. |  |
| processing_until | DATETIME(6) | YES | — | Lease end. |  |
| attempts | INT UNSIGNED | NO | 0 | Processing attempts. |  |
| last_error | VARCHAR(255) | YES | — | Last error message. |  |
| status | ENUM('pending','processing','done','failed') | NO | 'pending' | Processing status. | enum: pending, processing, done, failed |