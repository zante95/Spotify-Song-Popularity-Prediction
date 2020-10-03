#!/usr/bin/env sh
#
# Downloads the datasets into the [CURRENT_DIR]/resources directory.
#

set -e -u

DIR="$( cd "$( dirname "$0" )" && pwd )"

# --------------------------------
# Colors
# --------------------------------
# See: https://stackoverflow.com/a/5947802

COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[1;34m'
COLOR_RESET='\033[0m' # No Color

logerror() {
    printf "> ${COLOR_RED}$@${COLOR_RESET}\n"
}

logsuccess() {
    printf "> ${COLOR_GREEN}$@${COLOR_RESET}\n"
}

logwarning() {
    printf "> ${COLOR_YELLOW}$@${COLOR_RESET}\n"
}

loginfo() {
    printf "> ${COLOR_BLUE}$@${COLOR_RESET}\n"
}

# --------------------------------
# Datasets functions
# --------------------------------

download_top_tracks_2010_to_2019() {
    _dataset="leonardopena/top-spotify-songs-from-20102019-by-year"
    _file="top10s.csv"
    kaggle datasets download "$_dataset" -f "$_file"
    iconv -f iso-8859-1 -t utf-8 -o "$DIR/resources/top-tracks-2010-to-2019.csv" "$_file"
    rm "$_file"
}

download_top_tracks_2017() {
    _dataset="nadintamer/top-tracks-of-2017"
    _file="featuresdf.csv"
    kaggle datasets download "$_dataset" -f "$_file"
    mv "$_file" "$DIR/resources/top-tracks-2017.csv"
}

download_top_tracks_2018() {
    _dataset="nadintamer/top-spotify-tracks-of-2018"
    _file="top2018.csv"
    kaggle datasets download "$_dataset" -f "$_file"
    mv "$_file" "$DIR/resources/top-tracks-2018.csv"
}

download_top_tracks_2019() {
    _dataset="leonardopena/top50spotify2019"
    _file="top50.csv"
    kaggle datasets download "$_dataset" -f "$_file"
    iconv -f iso-8859-1 -t utf-8 -o "$DIR/resources/top-tracks-2019.csv" "$_file"
    rm "$_file"
}

download_tracks_1921_to_2020() {
    _dataset="yamaerenay/spotify-dataset-19212020-160k-tracks"
    _file="data.csv"
    _archive="$_file.zip"
    kaggle datasets download "$_dataset" -f "$_file"
    unzip "$_archive"
    mv "$_file" "$DIR/resources/tracks-1921-2020.csv"
    rm "$_archive"
}

# --------------------------------
# Main
# --------------------------------

chmod 600 "$HOME/.kaggle/kaggle.json"

loginfo "Downloading top tracks from 2010 to 2019"
download_top_tracks_2010_to_2019

loginfo "Downloading top tracks for 2017"
download_top_tracks_2017

loginfo "Downloading top tracks for 2018"
download_top_tracks_2018

loginfo "Downloading top tracks for 2019"
download_top_tracks_2019

loginfo "Downloading tracks from 1921 to 2020"
download_tracks_1921_to_2020

