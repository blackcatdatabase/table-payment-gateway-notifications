-- Auto-generated from schema-map-mysql.yaml (map@74ce4f4)
-- engine: mysql
-- table:  payment_gateway_notifications

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_payment FOREIGN KEY (tenant_id, transaction_id) REFERENCES payments(tenant_id, transaction_id) ON DELETE CASCADE;
