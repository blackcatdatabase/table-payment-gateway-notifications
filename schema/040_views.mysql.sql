-- Auto-generated from schema-views-mysql.yaml (map@sha1:A4E10261DACB7519F6FEA44ED77A92163429CA5E)
-- engine: mysql
-- table:  payment_gateway_notifications

-- Contract view for [payment_gateway_notifications]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_payment_gateway_notifications AS
SELECT
  id,
  transaction_id,
  tenant_id,
  received_at,
  version,
  processing_by,
  processing_until,
  attempts,
  last_error,
  status
FROM payment_gateway_notifications;
