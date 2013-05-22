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

if [ "$1" == 'thesis' ]; then
    cp -rn templates/thesis/* ..
    exit 0;
fi

echo -e "\nsetup.sh - sets up a report in parent directory, defined by a specified report type (the argument of setup.sh).\n";
echo "Currently supported arguments (report types):";
echo -e "onecol\t One-column report with front page.";
echo -e "twocol\t Same as one-column report, but two columns instead.";
echo -e "lecture\t Simple document to contain lecture notes and similar.";
echo -e "present\t Beamer presentation template.";
echo -e "thesis\t Larger thesis with layouted Chalmers front page.";
echo -e "";
echo -e "Any other argument generates this message. If more than one argument is given, the rest of the arguments are ignored."
echo -e "Created and maintained by Rikard Lundmark (www.rikardlundmark.com)."
echo -e ""
echo -e "These LaTeX templates are availible under the GNU GPL license."
echo -e ""
exit 1;