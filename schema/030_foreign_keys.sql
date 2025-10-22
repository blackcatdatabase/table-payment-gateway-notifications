-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: payment_gateway_notifications
ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_payment FOREIGN KEY (transaction_id) REFERENCES payments(transaction_id) ON DELETE CASCADE;
