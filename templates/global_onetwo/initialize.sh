#!/bin/bash
echo "Welcome to the Simple Setup Guide for the most common configurations for the selected report type. Please answer the following questions."

s=abc;

echo "Document title: "
read a
sed -i "s/Document title/$a/1" config/Titlepage.tex

echo "Document subtitle: "
read a
sed -i "s/Document subtitle/$a/1" config/Titlepage.tex

echo "Do you want to type in an abstract now? Only one-line abstract supported in command line. Default is no. (y/n)"
read a
if [[ $a == "Y" || $a == "y" ]]; then
    gnome-open sections/Abstract.tex
    #echo "Abstract (press enter to finish):"
    #read a
    #echo $a > sections/Abstract.tex
fi

bibliography=1;
echo "Do you need a bibliography? Default is yes. (y/n)"
read a
if [[ $a == "N" || $a == "n" ]]; then
    sed -i '/\\bibliography{bibliography\/Sources}/d' Report.tex
    sed -i '/\\addcontentsline{toc}{section}{\\numberline{}References}/d' Report.tex
    rm -r bibliography
    sed -i '1idefault: no-source-latex openprog\n' makefile
    bibliography=0;
fi


echo "Do you want to configure separated sections now? Default is no. (y/n)"
read a
if [[ $a == "Y" || $a == "y" ]]; then
    echo "Do you want a clearpage between your sections? Default is yes. (y/n)"
    read c
    CP="\\\\clearpage";
    if [[ $c == "N" || $c == "n" ]]; then
	CP="";
    fi
    
    echo "How many sections do you want to configure?"
    read N
    x=1;
    while [ $x -le $N ]
    do
	echo "Enter section header $x: "
	read s
	echo "Enter file name (without extension) $x: "
	read fn

	if [ $x -eq 1 ];
	then
	    if [ $bibliography -eq 1 ];
	    then
		mv sections/Content.tex sections/$fn.tex
		sed -i "s/section{Introduction}/section{$s}/1" sections/$fn.tex
	    else
		rm sections/Content.tex
		echo -e "\\section{$s}\n" >> sections/$fn.tex
	    fi
	else
	    echo "\\section{$s}" >> sections/$fn.tex
	fi
	sed -i "s/\\\\input{sections\/Content}/\\\\input{sections\/$fn}\n$CP\n&/" Report.tex
	
	if [ $x -eq $((N-1)) ]; then
	    if [ $bibliography -eq 0 ]; then
		CP="";
	    fi
	fi
	x=$(( $x + 1 ))
    done
    sed -i '/\\input{sections\/Content}/d' Report.tex
    echo "Sections are set up."
fi


