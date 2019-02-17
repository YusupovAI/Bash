#!/bin/bash

exec 2>/dev/null
count=2
dirname=$1
archive=$2
current=$(pwd)

cd $HOME 
mkdir $dirname
IFS=$'\n'
function addFiles {
	format=$1
	res=$(find $HOME -type f -name *.$format)
	for i in $res
	do
		filename=$(basename $i .$format)
		fullname=$filename.$format
		id=1
		while [ -e $dirname/$fullname ]
		do
			fullname=$filename$id.$format
			id=$(( $id + 1 ))
		done
		cp $i $HOME/$dirname/$fullname
	done	
}

for i in $@
do 
	if [ $count -ne 0 ]
	then
		count=$(( $count - 1 ))
		continue
	fi
	addFiles $i
done
tar -cf $archive.tar $dirname

cd $current
echo done
