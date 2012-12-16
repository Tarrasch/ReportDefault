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

if [ "$1" == 'present' ]; then
    cp -rn templates/present/* ..
    exit 0;
fi

if [ "$1" == 'cv' ]; then
    cp -rn templates/cv/* ..
    exit 0;
fi


echo "Use to set up a report in parent directory."
echo "Currently supported arguments:"
echo "twocol"
echo "onecol"
echo "lecture"
echo "present"
echo "cv"
exit 1;