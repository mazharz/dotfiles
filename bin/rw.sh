#!/bin/bash

defaultDir='/home/m47h4r/mzd/multimedia/picture/perfect pictures/'
dir=${1:-$defaultDir}

IFS=$'\r\n' GLOBIGNORE='*' command eval 'pictureList=($(find ${dir} -type f | grep -E -i "(\.jpg|\.jpeg|\.png)"))'

# get array length
pictureListLength=${#pictureList[@]}

currentPictureIndex=`shuf -i 1-$pictureListLength -n 1`
currentPicture=${pictureList[$currentPictureIndex]}
currentPictureName=`echo "${currentPicture}" | rev | cut -d'/' -f1 | rev`

# get a copy in ~/Pictures dir
cp "$currentPicture" ~/.config/wal.jpeg

feh --bg-fill ~/.config/wal.jpeg
