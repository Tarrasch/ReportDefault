#!/bin/bash
found="not";

if [ "$1" == 'twocol' ]; then
    cp -n templates/twocolumnreport/* ..
    found="yes";
fi

if [ "$1" == 'onecol' ]; then
    cp -n templates/onecolumnreport/* ..
    found="yes";
fi

if [ "$1" == 'lecture' ]; then
    cp -n templates/lecture/* ..
    found="yes";
fi

if [ "$found" == 'yes' ]; then
    cp -n templates/global/* ..
fi


echo "Use to set up a report in parent directory."
echo "Currently supported arguments:"
echo "twocol"