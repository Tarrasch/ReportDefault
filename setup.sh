#!/bin/bash
found="not";

if [ "$1" == 'twocol' ]; then
    cp -rn templates/twocolumnreport/* ..
    found="yes";
fi

if [ "$1" == 'onecol' ]; then
    cp -rn templates/onecolumnreport/* ..
    found="yes";
fi

if [ "$1" == 'lecture' ]; then
    cp -rn templates/lecture/* ..
    found="yes";
fi

if [ "$found" == 'yes' ]; then
    cp -rn templates/global/* ..
    exit 0;
fi


echo "Use to set up a report in parent directory."
echo "Currently supported arguments:"
echo "twocol"
exit 1;