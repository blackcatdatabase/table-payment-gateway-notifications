-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  payment_gateway_notifications

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_payment FOREIGN KEY (tenant_id, transaction_id) REFERENCES payments(tenant_id, transaction_id) ON DELETE CASCADE;
