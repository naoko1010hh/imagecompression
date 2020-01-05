#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ls $1 | while read line
do
    file $1/$line | awk '{print $2}'
    if [ "PNG" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "PNGンゴ $1/$line"
        optipng $1/$line
    elif [ "JPEG" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "JPEGンゴ $1/$line"
        jpegoptim --strip-all $1/$line
    elif [ "directory" = "`file $1/$line | awk '{print $2}'`" ] ; then
        echo "フォルダを見つけたンゴ $1/$line"
        $0 $1/$line
    fi
done