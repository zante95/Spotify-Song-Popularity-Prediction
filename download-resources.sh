#!/usr/bin/env sh
#
# Downloads resources into the workspace/resources directory.
#

DIR="$( cd "$( dirname "$0" )" && pwd )"

# mtcars.csv

echo "Downloading mtcars.csv"
URL="https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv"
curl -fsSL "$URL" -o "$DIR/workspace/resources/mtcars.csv"

# superstore-sales.csv

echo "Downloading superstore-sales.csv"
URL="https://raw.githubusercontent.com/BigDataGal/Python-for-Data-Science/master/Superstore-Sales.csv"
curl -fsSL "$URL" -o "$DIR/workspace/resources/superstore-sales.csv"

