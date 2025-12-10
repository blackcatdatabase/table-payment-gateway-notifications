# payment_gateway_notifications

Inbound notifications from payment gateways (webhooks, IPNs). transaction_id is REQUIRED and UNIQUE.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| attempts | mysql: INT / postgres: INTEGER | NO | 0 | Processing attempts. |
| id | BIGINT | NO |  | Surrogate primary key. |
| last_error | VARCHAR(255) | YES |  | Last error message. |
| processing_by | VARCHAR(100) | YES |  | Worker name processing the event. |
| processing_until | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | Lease end. |
| received_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When we received the notification (UTC). |
| status | mysql: ENUM('pending','processing','done','failed') / postgres: TEXT | NO | pending | Processing status. (enum: pending, processing, done, failed) |
| transaction_id | VARCHAR(255) | NO |  | Gateway transaction id (REQUIRED, UNIQUE). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_pg_notify_tenant_tx | tenant_id, transaction_id |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_pg_notify_status_received | status,received_at | INDEX idx_pg_notify_status_received (status, received_at) |
| idx_pg_notify_tenant_status_received | tenant_id,status,received_at | INDEX idx_pg_notify_tenant_status_received (tenant_id, status, received_at) |
| ux_pg_notify_tenant_tx | tenant_id,transaction_id | UNIQUE KEY ux_pg_notify_tenant_tx (tenant_id, transaction_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_pg_notify_payment | tenant_id,transaction_id | payments(tenant_id,transaction_id) | ON DELETE CASCADE |
| fk_pg_notify_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_pg_notify_tenant_tx | tenant_id, transaction_id |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_pg_notify_status_received | status,received_at | CREATE INDEX IF NOT EXISTS idx_pg_notify_status_received ON payment_gateway_notifications (status, received_at) |
| idx_pg_notify_tenant_status_received | tenant_id,status,received_at | CREATE INDEX IF NOT EXISTS idx_pg_notify_tenant_status_received ON payment_gateway_notifications (tenant_id, status, received_at) |
| ux_pg_notify_tenant_tx | tenant_id,transaction_id | CREATE UNIQUE INDEX IF NOT EXISTS ux_pg_notify_tenant_tx ON payment_gateway_notifications (tenant_id, transaction_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_pg_notify_payment | tenant_id,transaction_id | payments(tenant_id,transaction_id) | ON DELETE CASCADE |
| fk_pg_notify_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_payment_gateway_notifications | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_payment_gateway_notifications | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
