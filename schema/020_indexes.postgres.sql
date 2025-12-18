-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  payment_gateway_notifications

CREATE UNIQUE INDEX IF NOT EXISTS ux_pg_notify_tenant_tx ON payment_gateway_notifications (tenant_id, transaction_id);

CREATE INDEX IF NOT EXISTS idx_pg_notify_status_received ON payment_gateway_notifications (status, received_at);

CREATE INDEX IF NOT EXISTS idx_pg_notify_tenant_status_received ON payment_gateway_notifications (tenant_id, status, received_at);
