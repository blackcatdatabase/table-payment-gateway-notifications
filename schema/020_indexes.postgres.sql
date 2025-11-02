-- Auto-generated from schema-map-postgres.psd1 (map@db2f8b8)
-- engine: postgres
-- table:  payment_gateway_notifications
CREATE INDEX IF NOT EXISTS idx_pg_notify_status_received ON payment_gateway_notifications (status, received_at);
