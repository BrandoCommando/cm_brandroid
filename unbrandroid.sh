#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
if [ ! -z "$2" ]; then DIR="$2"; cd "$DIR"; fi

branch="cm-12.0"
if [ ! -z "$1" ]
then
	branch="$1"
fi

cd frameworks/base
git checkout github/$branch
cd ../..

#cd packages/apps/Settings
#git checkout github/$branch
#cd ../../..

cd vendor/cm
git checkout github/$branch
cd ../..

cd device/lge/g2-common
git checkout github/cm-12.0
cd ../../..

