#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cp -rf $1 $1-max-`date`
ls $1 | while read line
do
    file $1/$line | awk '{print $2}'
    if [ "PNG" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "PNGンゴ $1/$line"
        optipng $1/$line
        cwebp -q 60 $1/$line -o $1/$line.webp 
    elif [ "JPEG" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "JPEGンゴ $1/$line"
        jpegoptim --strip-all $1/$line
        cwebp -q 60 $1/$line -o $1/$line.webp
    elif [ "directory" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "フォルダを見つけたンゴ $1/$line"
        $0 $1/$line
    fi
done