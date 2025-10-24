-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  payment_gateway_notifications
CREATE INDEX idx_pg_notify_status_received ON payment_gateway_notifications (status, received_at);
