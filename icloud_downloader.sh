# Create a directory for iCloud
mkdir /var/iCloud

# Change to the newly created directory
cd /var/iCloud

# Download the icloud_photos_downloader from GitHub
wget https://github.com/scaraebeus/icloud_photos_downloader/archive/refs/heads/auth_fix.zip

# Unzip the downloaded file
unzip auth_fix.zip

# Change to the directory of the unzipped content
cd icloud_photos_downloader-auth_fix

# Build the Docker image
docker build . -t icloudpd_dev

# Run the Docker container
# Note: Replace <username> with your iCloud username and <password> with your iCloud password.
# Replace "/mnt/iCloud" with the path where you want the photos to be saved.
sudo docker run -it --rm --name icloudpd -v /mnt/iCloud:/data -e TZ=Europe/Berlin icloudpd_dev icloudpd --directory /data --username test@gmail.com --watch-with-interval 1800 --password Mypasword
