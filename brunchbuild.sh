#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
start=`date +%s`
device="d800"
if [ "$1" ]
then
	device="$1"
fi
source build/envsetup.sh
brunch $device
if [ $? -eq 0 ]; then
	result="Success"
else
	result="Failure"
fi
end=`date +%s`
diff=`expr $end - $start`
dm=`expr $diff / 60`
dh=`expr $dm / 60`
ds=`expr $diff % 60`
echo Build took $dm minutes: $result
echo "CM Build $result for $device" > /tmp/build.txt
echo "Build completed in $dm minutes" >> /tmp/build.txt
if [ -f "nohup.out" ]; then tail -n50 nohup.out >> /tmp/build.txt; fi
nsz=`stat -c "%s" nohup.out`
nohup="`pwd`/nohup.out"
if [ "$nsz" -gt 5000000 ]; then
	gzip nohup.out
	nohup="`pwd`/nohup.out.gz"
fi
/home/brandon/git/rg-scripts/send_attachment.sh "CM Build $result for $device" /tmp/build.txt $nohup "brandroid64@gmail.com"
rm /tmp/build.txt
