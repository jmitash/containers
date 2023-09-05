#!/bin/sh

set -e

mkdir components
cd components

# Download an existing GA archive
wget https://downloads.bitnami.com/files/stacksmith/spring-cloud-skipper-2.9.3-3-linux-amd64-debian-11.tar.gz
# Explode it
tar -xzf spring-cloud-skipper-2.9.3-3-linux-amd64-debian-11.tar.gz

# Navigate to JARs
cd spring-cloud-skipper-2.9.3-linux-amd64-debian-11/files/spring-cloud-skipper/

# Clean this - we'll replace with a different version
rm *.jar

wget https://repo.spring.io/milestone/org/springframework/cloud/spring-cloud-skipper-server/2.11.0-RC1/spring-cloud-skipper-server-2.11.0-RC1.jar

# This is symlinked in the original archive, so create another pointing to our version
ln -s spring-cloud-skipper-server-2.11.0-RC1.jar spring-cloud-skipper.jar

# Back out and rename to new version
cd ../../../
mv spring-cloud-skipper-2.9.3-linux-amd64-debian-11/ spring-cloud-skipper-2.11.0-RC1-linux-amd64-debian-11/

# Archive and gzip, just like the original file we downloaded
tar -czf spring-cloud-skipper-2.11.0-RC1-linux-amd64-debian-11.tar.gz spring-cloud-skipper-2.11.0-RC1-linux-amd64-debian-11/

# Clean up
rm -r spring-cloud-skipper-2.9.3-3-linux-amd64-debian-11.tar.gz spring-cloud-skipper-2.11.0-RC1-linux-amd64-debian-11/
