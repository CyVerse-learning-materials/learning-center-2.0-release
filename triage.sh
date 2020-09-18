#!/bin/bash
# CyVerse Learning Center 2.0 Organize Repos Script Sep 2020
# There are a few hard paths here you may way to modify for reuse

# parse arguments for the script

usage="This script takes as input a (-d | --directory) directory which should \
       only contain individual repos using CyVerse repos versioned <2.0"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--directory) repo_directory="$2"; shift ;;
        -h|--help) echo $usage; exit ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
  echo "Using the github repos $repo_directory"
done

# make list of repos
ls $repo_directory/ | sed 's#/##' >repos.txt
WORK=$(pwd)
echo "working directory is $WORK"


# make list of repos/directories cloned

while IFS= read -r line
 do
    repo=$line
    echo "switching to master branch" $repo
    cd $repo_directory$repo
    git switch master
    git pull
    wget https://raw.githubusercontent.com/CyVerse-learning-materials/learning-center-2.0-release/master/triage-for-2-0-release.md
    mkdir -p .github/ISSUE_TEMPLATE/
    rm -f github/ISSUE_TEMPLATE/triage-for-2-0-release.md
    mv triage-for-2-0-release.md .github/ISSUE_TEMPLATE/
    git add .github
    git commit -am "add triage issue template"
    git push
    git switch "learning_center_2_0_release_candidate"
    cd ..
done < repos.txt
rm repos.txt
