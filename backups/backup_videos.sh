#!/bin/bash

# Backup media files to external harddrive
echo # blank line to make output easier to read

# What to backup
backup_directory="/media/aaron/External1/Media/Videos"
if [ -d "$backup_directory" ]
then
    echo "$backup_directory exists so can be backed up"
else
    echo "[ERROR]: Dirctory $backup_directory cannot be found"
    echo "Stopping backup"
    return 0
fi

harddrive_2="/media/aaron/External2"
if [ -d "$harddrive_2" ]
then
    echo "$harddrive_2 exists so can be copied to"
else
    echo "[ERROR]: External harddive 2 cannot be found"
    echo "Stopping backup"
    return 0
fi

# Where to backup
dest="/media/aaron/External2/Backups/Videos"
if [ -d "$dest" ]
then
    echo "The backup directory $dest exists"
else
    echo "Making directory $dest to be backed up to"
    mkdir -p $dest
fi

# Deleting any backup older than 28 days
echo "Removing backups older than 28 days"
find $dest/*videos_backup.tar.gz -mtime +28 -delete

# Create archive filename
day=$(date +%Y%m%d_%H%M)
#hostname=$(hostname -s)
archive_file=$day"_videos_backup.tar.gz"

# Print start status message
echo "Backing up $backup_files to $dest/$archive_file"

# Backup the files using tar.
tar -czvf $dest/$archive_file $backup_directory

# Print end status message.
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
