#!/bin/bash

# ===========================================
# Backup Script for Nginx Web Directory
# Archives /var/www/html into /backups
# Keeps only the last 7 days of backups
# ===========================================

# Source and destination
SRC="/var/www/html"
DEST="/backups"
DATE=$(date +%F-%H%M)

# Create backup directory if missing
mkdir -p $DEST

# Create compressed archive with timestamp
tar -czf $DEST/web-backup-$DATE.tar.gz $SRC

# Remove backups older than 7 days
find $DEST -type f -mtime +7 -name "*.tar.gz" -exec rm {} \;
