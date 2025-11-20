<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – payment_gateway_notifications

Inbound notifications from payment gateways (webhooks, IPNs). transaction_id is REQUIRED and UNIQUE.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| transaction_id | VARCHAR(255) | NO | — | Gateway transaction id (REQUIRED, UNIQUE). |  |
| tenant_id | BIGINT | NO | — |  |  |
| received_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When we received the notification (UTC). |  |
| version | INTEGER | NO | 0 |  |  |
| processing_by | VARCHAR(100) | YES | — | Worker name processing the event. |  |
| processing_until | TIMESTAMPTZ(6) | YES | — | Lease end. |  |
| attempts | INTEGER | NO | 0 | Processing attempts. |  |
| last_error | VARCHAR(255) | YES | — | Last error message. |  |
| status | TEXT | NO | 'pending' | Processing status. | enum: pending, processing, done, failed |