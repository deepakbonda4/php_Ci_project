#!/bin/bash

#repo=$1
#repoName=$2
#branch=$3
#days=$4

read -p "enter the repo url : " repoURL
read -p "enter the branch name : " branch
read -p "enter the number of days you want to see logs : " daysToLog
read -p "enter the name of the repo : " repoName

git init

echo "cloning the repository here------------------------------------------------------------------------->>"
git clone $repoURL
REPOSITORY=`ls -l | grep $repoName`
if [ -z "$REPOSITORY" ]; then
	echo "=============================================================================================="
	echo "no repo found with name $repoName please run the script again with correct repo name"
	exit 1
else
	cd $repoName
fi

GITBRANCH=`git branch -a | grep $branch`
if [ -z "$GITBRANCH" ]; then
	echo "==============================================================================================="
	echo "branch $branch doesnot exist please run the script again with correct branch name"
	exit 1
else
	git checkout $branch
fi

echo "you have the below files present in the repo $repoName--------------------------------------------------->>"
ls -l

echo "Below is the history of your last $daysToLog days----------------------------------------------------------->>"
git log --pretty=format:'%h|%an|%ae|%ad|%s|%n' -n $daysToLog
git log --oneline |  grep JIRA

#git log --pretty=format:'%h|%an|%ae|%ad|%s|%n' -n $daysToLog >> index.html



