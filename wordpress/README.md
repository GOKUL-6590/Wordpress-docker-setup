cat > README.md <<'EOF'
# WordPress Docker

## Quick start
1. Copy `.env` and edit credentials.
2. Start:
   \`\`\`bash
   docker compose up -d
   \`\`\`
3. Open WordPress at http://localhost:8000
   phpMyAdmin at http://localhost:8080 (root / MYSQL_ROOT_PASSWORD)

## Useful commands
- View logs: \`docker compose logs -f wordpress\`
- Shell into WP container: \`docker compose exec wordpress bash\`
- Stop: \`docker compose down\`
- Stop & remove volumes: \`docker compose down -v\`

## Backups
- \`./scripts/backup.sh\`
- Restore: \`./scripts/restore.sh path/to/backup.sql\`

EOF

