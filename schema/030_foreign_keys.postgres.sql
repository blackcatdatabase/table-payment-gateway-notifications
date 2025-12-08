-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  payment_gateway_notifications

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE payment_gateway_notifications ADD CONSTRAINT fk_pg_notify_payment FOREIGN KEY (tenant_id, transaction_id) REFERENCES payments(tenant_id, transaction_id) ON DELETE CASCADE;
