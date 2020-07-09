#!/bin/bash

# Backup media files to external harddrive

# What to backup
backup_file="/media/aaron/External1/Media"

# Where to backup
dest="/media/aaron/External2"

# Create archive filename
day=$(date +%Y%m%d%H%M)
#hostname=$(hostname -s)
archive_file=$day"_media_backup.tar.gz"

# Print start status message
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar -czvf $dest/$archive_file $backup_file

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
