#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <backup_directory>"
    exit 1
fi
source_dir="$1"
backup_dir="$2"
mkdir -p "$backup_dir"
backup_file="backup_$(date +%Y%m%d).tar.gz"
tar -czf "$backup_dir/$backup_file" "$source_dir"
find "$backup_dir" -type f -name "backup_*" -mtime +7 -exec rm {} \;

echo "Backup telah dibuat dan backup lama yang lebih dari 7 hari telah dihapus."
