#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

branch="cm-12.0"
if [ "$1" ]
then
	branch="$1"
fi
cd frameworks/base
git pull --no-edit https://github.com/BrandoCommando/android_frameworks_base.git $branch
cd ../..

cd vendor/cm
git pull --no-edit https://github.com/BrandoCommando/android_vendor_cm $branch
cd ../..

cd device/lge/g2-common
git pull --no-edit https://github.com/BrandoCommando/android_device_lge_g2-common.git $branch
cd ../../..

find out/target -maxdepth 5 -name build.prop | xargs -I FFFF rm FFFF

