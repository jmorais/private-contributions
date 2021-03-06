#!/bin/sh

set -e
set -u

PROCESS=github.jmorais.privatecontributions
PLIST="$PROCESS".plist
LAUNCHD_DIR=~/Library/LaunchAgents
SCRIPT_NAME=private_contributions.sh

pushd $(dirname "${0}") > /dev/null
BASE_DIR=$(pwd -L)
popd > /dev/null

cd "${BASE_DIR}"

SCRIPT_ABSPATH=`echo "$BASE_DIR"/"$SCRIPT_NAME" | sed -e "s#\/#\\\\\/#g"`
chmod +x "$BASE_DIR/$SCRIPT_NAME"

echo "Created $BASE_DIR/$SCRIPT_NAME"

cp "$PLIST.template" "$PLIST"
sed "s#PROGRAM_PATH#$SCRIPT_ABSPATH#g" "$PLIST.template" > "$PLIST"
mv "$PLIST" "$LAUNCHD_DIR"

echo "Created $LAUNCHD_DIR/$PLIST"

launchctl unload "$LAUNCHD_DIR/$PLIST"
launchctl load "$LAUNCHD_DIR/$PLIST"
launchctl stop "$PROCESS"
launchctl start "$PROCESS"

echo "`date`: launchctl start $PROCESS"
echo "Will continue to launch process every 24 hours."

exit