cat > scripts/restore.sh <<'EOF'
#!/usr/bin/env bash
set -e
if [ -z "\$1" ]; then
  echo "Usage: ./restore.sh <path-to-sql-file>"
  exit 1
fi
SQLFILE="\$1"
echo "Restoring DB from \$SQLFILE..."
docker compose exec -T db sh -c 'mysql -u"\$MYSQL_USER" -p"\$MYSQL_PASSWORD" "\$MYSQL_DATABASE"' < "\$SQLFILE"
echo "Restore complete."
EOF
chmod +x scripts/restore.sh

