-- Auto-generated from schema-map-postgres.yaml (map@94ebe6c)
-- engine: postgres
-- table:  payment_gateway_notifications

CREATE UNIQUE INDEX IF NOT EXISTS ux_pg_notify_tenant_tx ON payment_gateway_notifications (tenant_id, transaction_id);

CREATE INDEX IF NOT EXISTS idx_pg_notify_tenant_status_received ON payment_gateway_notifications (tenant_id, status, received_at);
