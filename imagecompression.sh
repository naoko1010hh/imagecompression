#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ls $1 | while read line
do
    file $1/$line | awk '{print $2}'
    if [ "PNG" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "PNGンゴ $1/$line"
        optipng $1/$line
        if [ "webp" = "$2" ] ; then
            cwebp -q 60 $1/$line -o $1/$line.webp
        fi
    elif [ "JPEG" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "JPEGンゴ $1/$line"
        jpegoptim --strip-all $1/$line
        if [ "webp" = "$2" ] ; then
            cwebp -q 60 $1/$line -o $1/$line.webp
        fi
    elif [ "directory" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "フォルダを見つけたンゴ $1/$line"
        $0 $1/$line $2
    fi
done