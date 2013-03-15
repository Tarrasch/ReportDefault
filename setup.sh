#!/bin/bash

function main()
{
    cd "$(dirname "$0")"
    
    case "$1" in
	
	"twocol")    
	    cp -rn templates/twocolumnreport/* ..
	    cp -rn templates/global_onetwo/* ..
	    mkdir -p ../fig/
	    ;;
	"onecol")
	    cp -rn templates/onecolumnreport/* ..
	    cp -rn templates/global_onetwo/* ..
	    mkdir -p ../fig/
	    ;;
	"lecture")
	    cp -rn templates/lecture/* ..
	    ;;
	"cv")
	    cp -rn templates/cv/* ..
	    ;;
	"coverletter")
	    cp -rn templates/coverletter/* ..
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
    echo -e "twocol \t\t (two-column report)";
    echo -e "onecol \t\t (one-column report)";
    echo -e "lecture \t (lecture notes)";
    echo -e "present \t (beamer presentation)";
    echo -e "cv \t\t (Curriculum Vitae)";
    exit 1;    
}

main $1