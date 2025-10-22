-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: payment_gateway_notifications
CREATE TABLE IF NOT EXISTS payment_gateway_notifications (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  transaction_id VARCHAR(255) NULL,
  received_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  processing_by VARCHAR(100) NULL,
  processing_until DATETIME(6) NULL,
  attempts INT UNSIGNED NOT NULL DEFAULT 0,
  last_error VARCHAR(255) NULL,
  status ENUM(''pending'',''processing'',''done'',''failed'') NOT NULL DEFAULT ''pending'',
  UNIQUE KEY ux_pg_notify_tx (transaction_id),
  INDEX idx_pg_notify_status_received (status, received_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
