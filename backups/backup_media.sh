#!/bin/bash

# Run all back up scripts

echo
echo "Backing up Photos"
source /home/aaron/Software/utils/backups/backup_pictures.sh
echo
echo "Backing up Music"
source /home/aaron/Software/utils/backups/backup_music.sh
echo
echo "Backing up Videos"
source /home/aaron/Software/utils/backups/backup_videos.sh
