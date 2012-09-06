#!/bin/bash
cd "$(dirname "$0")"

if [ "$1" == 'twocol' ]; then
    cp -rn templates/twocolumnreport/* ..
    cp -rn templates/global_onetwo/* ..
    mkdir -p ../fig/
    exit 0;
fi

if [ "$1" == 'onecol' ]; then
    cp -rn templates/onecolumnreport/* ..
    cp -rn templates/global_onetwo/* ..
    mkdir -p ../fig/
    exit 0;
fi

if [ "$1" == 'lecture' ]; then
    cp -rn templates/lecture/* ..
    exit 0;
fi

echo "Use to set up a report in parent directory."
echo "Currently supported arguments:"
echo "twocol"
echo "onecol"
echo "lecture"
exit 1;