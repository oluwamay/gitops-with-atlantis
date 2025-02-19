#!/bin/sh
set -e

# ATLANTIS_VERSION=v0.19.4
# ATLANTIS_PACKAGE=atlantis_linux_386.zip

# echo "Download atlantis library"
# wget https://github.com/runatlantis/atlantis/releases/${ATLANTIS_VERSION}/${ATLANTIS_PACKAGE}
# unzip ${ATLANTIS_PACKAGE}

# echo "Download ngrok"
# wget -c https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz -O -tar -xz

if [ jq --version ]; then
    echo "jq is installed"
else
    echo "jq is not installed. Installing jq"
    brew install jq 
fi

#Check if atlantis.zip is already downloaded 

if [ -f atlantis.zip]; then
    echo "atlantis.zip is already downloaded"

else
    echo "atlantis.zip is not downloaded"
    LATEST_VERSION=$(curl -s https://api.github.com/repos/runatlantis/atlantis/releases/latest | jq -r '.tag_name')
    ATLANTIS_VERSION=${LATEST_VERSION}
    ATLANTIS_PACKAGE="atlantis_darwin_amd64.zip" 
    DOWNLOAD_URL="https://github.com/runatlantis/atlantis/releases/download/${ATLANTIS_VERSION}/${ATLANTIS_PACKAGE}"

    echo "Download atlantis library"
    wget -O atlantis.zip "$DOWNLOAD_URL" || curl -L -o atlantis.zip "$DOWNLOAD_URL"
fi

unzip atlantis.zip

#Make the instance accessible over the internet using ngrok
echo "Download ngrok"

if [ -f ngrok-v3-stable-darwin-amd64.zip ]; then
    echo "ngrok is already downloaded"
else
    echo "ngrok is not downloaded. Downloading ngrok"
    curl -L -o ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-darwin-amd64.zip
fi

unzip ngrok.zip

echo "Generate random string"
echo $RANDOM | md5sum | head -c 20; echo;

#Clean up
echo "Cleaning up the downloaded files"
rm -rf ngrokzip
rm -rf atlantis.zip