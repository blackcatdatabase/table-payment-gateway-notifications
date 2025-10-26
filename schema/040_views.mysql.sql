-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  payment_gateway_notifications
-- Contract view for [payment_gateway_notifications]
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_payment_gateway_notifications AS
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
