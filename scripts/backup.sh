cat > scripts/backup.sh <<'EOF'
#!/usr/bin/env bash
set -e

source ../.env 2>/dev/null || source .env

TIMESTAMP=\$(date +%Y%m%d_%H%M%S)
BACKUP_DIR=./backups
mkdir -p "\$BACKUP_DIR"

echo "Dumping MySQL database..."
docker compose exec db sh -c 'exec mysqldump --single-transaction --databases \"\$MYSQL_DATABASE\" -u\"\$MYSQL_USER\" -p\"\$MYSQL_PASSWORD\"' > "\$BACKUP_DIR/db_\$TIMESTAMP.sql"

echo "Archiving wp uploads..."
docker compose exec wordpress tar -C /var/www/html/wp-content -czf /tmp/wp_uploads_\$TIMESTAMP.tar.gz uploads || true
docker cp wp_app:/tmp/wp_uploads_\$TIMESTAMP.tar.gz "\$BACKUP_DIR/" || true

echo "Backups saved in \$BACKUP_DIR"
EOF
chmod +x scripts/backup.sh

