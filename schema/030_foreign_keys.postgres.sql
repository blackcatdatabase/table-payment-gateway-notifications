-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  payment_gateway_notifications

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_payment FOREIGN KEY (tenant_id, transaction_id) REFERENCES payments(tenant_id, transaction_id) ON DELETE CASCADE;
