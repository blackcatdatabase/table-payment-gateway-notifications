-- Auto-generated from schema-views-postgres.psd1 (map@38d5403)
-- engine: postgres
-- table:  payment_gateway_notifications
-- Contract view for [payment_gateway_notifications]
CREATE OR REPLACE VIEW vw_payment_gateway_notifications AS
SELECT
  id,
  transaction_id,
  received_at,
  processing_by,
  processing_until,
  attempts,
  last_error,
  status
FROM payment_gateway_notifications;
