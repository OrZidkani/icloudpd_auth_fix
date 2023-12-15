#!/bin/bash

# Check if both arguments (username and password) are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <iCloud_username> <iCloud_password>"
    exit 1
fi

# Assign arguments to variables
ICLOUD_USERNAME=$1
ICLOUD_PASSWORD=$2

# Create a directory for iCloud
mkdir /var/iCloud

# Change to the newly created directory
cd /var/iCloud

# Download the script
wget https://github.com/scaraebeus/icloud_photos_downloader/archive/refs/heads/auth_fix.zip

# Unzip the downloaded file
unzip auth_fix.zip

# Change to the directory of the unzipped content
cd icloud_photos_downloader-auth_fix

# Build the Docker image
docker build . -t icloudpd_dev

# Run the Docker container with the provided username and password
sudo docker run -it --rm --name icloudpd -v /mnt/iCloud:/data -e TZ=Europe/Berlin icloudpd_dev icloudpd --directory /data --username
