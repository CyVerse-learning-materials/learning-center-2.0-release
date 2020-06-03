#!/bin/bash
# CyVerse Learning Center 2.0 Organize Repos Script May 2020
# There are a few hard paths here you may way to modify for reuse

# parse arguments for the script

usage="This script takes as input a text file of urls (-u | --urls) urls which \
       should only contain URLS for repos in the CyVerse learning center \
       versioned <2.0"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -u|--urls) urls_list="$2"; shift ;;
        -h|--help) echo $usage; exit ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
  echo "Using the list of github repos $urls_list"
done

mkdir ~/Dropbox/cyverse_learning_2_0_release
cp $urls_list ~/Dropbox/cyverse_learning_2_0_release
cd ~/Dropbox/cyverse_learning_2_0_release

# clone repos to upgrade

while IFS= read -r line
 do
    remote=$line
    echo "cloning" $remote
    git clone $remote
done < $urls_list

rm $urls_list

# make list of repos/directories cloned
ls -d */ | sed 's#/##' >repos.txt

while IFS= read -r line
 do
    repo=$line
    echo "creating 2.0 release branch for" $repo
    cd $repo
    git checkout -b "learning_center_2_0_release_candidate"
    git push origin "learning_center_2_0_release_candidate"
    git push --set-upstream origin "learning_center_2_0_release_candidate"
    cd ..
done < repos.txt
rm repos.txt
