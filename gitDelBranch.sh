#!/bin/bash

BRANCH=$1

BRANCH_LIST=''

BRANCH_LIST=`git branch -a |grep "$1"`


for pids in $BRANCH_LIST; do

	echo $pids

done

echo "Proceed anyway delete branch list? (y,n)"

read input

if [ "$input" = "y" ];then

	for pid in $BRANCH_LIST; do

        	local=${pid/remotes\/origin\//}

        	`git push origin :$local`

        	`git branch -D $local`

	done


fi



exit -1;




