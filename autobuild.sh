#!/bin/bash
PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
echo "Running from path: $PATH"
repo sync > $PATH/auto.log
if [ $? -ne 0 ]; then exit 1; fi
$PATH/brandroid_fix.sh cm-12.0 >> $PATH/auto.log
$PATH/changelog.sh $PATH/changelog_auto.log >> $PATH/auto.log
/usr/bin/cat $PATH/changelog_auto.log
device="d800"
if [ ! -z "$1" ]; then device="$1"; fi
echo Running build for $device
$PATH/brunchbuild.sh $device >> $PATH/auto.log

