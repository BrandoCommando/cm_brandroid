#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
date=`date +'%Y-%m-%d'`
fname=`echo "changelog_$date" | sed -e "s:/::g"`
if [ "$1" ]
then
	fname="$1"
fi
echo ====================== > $fname
echo === 1 week changes === >> $fname
echo ====================== >> $fname
repo forall -pc 'git hist --since="1 week ago" --no-merges' | grep -v ranslation >> $fname
echo "" >> $fname
echo ====================== >> $fname
echo == 1 week - 1 month == >> $fname
echo ====================== >> $fname
repo forall -pc 'git hist --since="1 month ago" --after="1 week ago" --no-merges' | grep -v ranslation >> $fname
echo "" >> $fname
echo ====================== >> $fname
echo ==== 1 - 3 months ==== >> $fname
echo ====================== >> $fname
repo forall -pc 'git hist --since="3 months ago" --after="1 month ago" --no-merges' | grep -v ranslation >> $fname
lines=`wc -l $fname`
echo "Printed $lines lines to $fname"

