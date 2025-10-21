# 📦 Payment Gateway Notifications

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->

> Schema package for table **payment_gateway_notifications** (repo: `payment-gateway-notifications`).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| transaction_id | VARCHAR(255) | YES | — |  |
| received_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |
| processing_by | VARCHAR(100) | YES | — |  |
| processing_until | DATETIME(6) | YES | — |  |
| attempts | INT UNSIGNED | NO | 0 |  |
| last_error | VARCHAR(255) | YES | — |  |
| status | ENUM('pending','processing','done','failed') | NO | '' |  |

## Relationships
- FK → **payments** via (transaction_id) (ON DELETE CASCADE).

```mermaid
erDiagram
  PAYMENT_GATEWAY_NOTIFICATIONS {
    INT id PK
    VARCHAR transaction_id
    DATETIME received_at
    VARCHAR processing_by
    DATETIME processing_until
    INT attempts
    VARCHAR last_error
    ENUM status
  }
  PAYMENT_GATEWAY_NOTIFICATIONS }o--|| PAYMENTS : "transaction_id"
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.

