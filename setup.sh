#!/bin/bash

function main()
{
    cd "$(dirname "$0")"
    
    case "$1" in
	
	"twocol")    
	    cp -rn templates/twocolumnreport/* ..
	    cp -rn templates/global_onetwo/* ..
	    cp -rn templates/global ..
	    mkdir -p ../fig/
	    ;;
	"onecol")
	    cp -rn templates/onecolumnreport/* ..
	    cp -rn templates/global_onetwo/* ..
	    cp -rn templates/global ..
	    mkdir -p ../fig/
	    ;;
	"lecture")
	    cp -rn templates/lecture/* ..
	    cp -rn templates/global ..
	    ;;
	"present")
	    cp -rn templates/present/* ..
	    cp -rn templates/global ..
	    ;;
	"cv")
	    cp -rn templates/cv/* ..
	    cp -rn templates/global ..
	    ;;
	"coverletter")
	    cp -rn templates/coverletter/* ..
	    cp -rn templates/global ..
	    ;;
	"thesis")
		cp -rn templates/thesis/* ..
		cp -rn templates/global ..
		;;
	*)
	    print_error_and_fail
    esac
    
    if [ -f ../initialize.sh ]
	then
	cd ..
	./initialize.sh
    fi
    
}

function print_error_and_fail()
{
    echo "Use to set up a report in parent directory.";
    echo "Currently supported report types:";
    echo -e "onecol \t\t (Creates a one-column standard report)";
    echo -e "twocol \t\t (Same as onecol, but two column text instead)";
    echo -e "lecture \t (Small template for taking lecture notes)";
    echo -e "present \t (Template for Beamer presentation)";
    echo -e "coverletter \t (Cover letter for job application)";
    echo -e "cv \t\t (Curriculum Vitae template)";
    exit 1;    
}

main $1