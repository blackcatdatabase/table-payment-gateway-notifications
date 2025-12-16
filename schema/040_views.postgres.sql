-- Auto-generated from schema-views-postgres.yaml (map@sha1:A35B3CB52780A1043442511D947A51BA2C27622C)
-- engine: postgres
-- table:  payment_gateway_notifications

-- Contract view for [payment_gateway_notifications]
CREATE OR REPLACE VIEW vw_payment_gateway_notifications AS
SELECT
  id,
  tenant_id,
  transaction_id,
  received_at,
  version,
  processing_by,
  processing_until,
  attempts,
  last_error,
  status
FROM payment_gateway_notifications;
