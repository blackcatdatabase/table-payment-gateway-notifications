-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  payment_gateway_notifications
CREATE TABLE IF NOT EXISTS payment_gateway_notifications (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  transaction_id VARCHAR(255) NOT NULL,
  tenant_id BIGINT UNSIGNED NOT NULL,
  received_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  version INT UNSIGNED NOT NULL DEFAULT 0,
  processing_by VARCHAR(100) NULL,
  processing_until DATETIME(6) NULL,
  attempts INT UNSIGNED NOT NULL DEFAULT 0,
  last_error VARCHAR(255) NULL,
  status ENUM('pending','processing','done','failed') NOT NULL DEFAULT 'pending',
  UNIQUE KEY ux_pg_notify_tenant_tx (tenant_id, transaction_id),
  INDEX idx_pg_notify_status_received (status, received_at),
  INDEX idx_pg_notify_tenant_status_received (tenant_id, status, received_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
