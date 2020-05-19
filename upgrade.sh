#!/bin/bash
# CyVerse Learning Center 2.0 Release Script May 2020

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

# get list of repo folders to upgrade

while IFS= read -r line
 do
    repo=$line
    echo "Upgrading" $repo_directory$repo
    mkdir -p $repo_directory$repo/.github/ISSUE_TEMPLATE/
    echo "Copying 1 of 12 - triage-for-2-0-release.md to" $repo_directory$repo
    cp $WORK/triage-for-2-0-release.md $repo_directory$repo/.github/ISSUE_TEMPLATE/
    echo "Copying 2 of 12 - cyverse.css to" $repo_directory$repo
    cp $WORK/cyverse.css $repo_directory$repo/misc/static/
    echo "Copying 3 of 12 - cyverse.js to" $repo_directory$repo
    cp $WORK/cyverse.js $repo_directory$repo/misc/static/
    echo "Copying 4 of 12 - detail-expand.css to" $repo_directory$repo
    cp $WORK/detail-expand.css $repo_directory$repo/misc/static/
    echo "Copying 5 of 12 - intercom-script-for-learning.js to" $repo_directory$repo
    cp $WORK/intercom-script-for-learning.js $repo_directory$repo/misc/static/
    echo "Copying 6 of 12 - question-answer.js to" $repo_directory$repo
    cp $WORK/question-answer.js $repo_directory$repo/misc/static/
    echo "Copying 7 of 12 - jquery.tablesorter.min.js to" $line
    cp $WORK/jquery.tablesorter.min.js $repo_directory$repo/misc/static/
    echo "Copying 8 of 12 - custom_urls.txt to" $repo_directory$repo
    cp $WORK/custom_urls.txt $repo_directory$repo/
    echo "Copying 9 of 12 - cyverse_learning.png to" $repo_directory$repo
    cp $WORK/img/cyverse_learning.png $repo_directory$repo/img/cyverse_learning.png
    echo "Copying 10 of 12 - intercom.png to" $repo_directory$repo
    cp $WORK/img/intercom.png $repo_directory$repo/img/intercom.png
    echo "Copying 11 of 12 - License.md to" $repo_directory$repo
    cp $WORK/License.md $repo_directory$repo/License.md
    echo "Copying 12 of 12 - Powered-By-CyVerse-blue.png to" $repo_directory$repo
    cp $WORK/img/Powered-By-CyVerse-blue.png $repo_directory$repo/img/Powered-By-CyVerse-blue.png
    echo "Add defined cyverse_rst_defined_substitutions if needed"
    test -f $repo_directory$repo/cyverse_rst_defined_substitutions.txt|| cp $WORK/cyverse_rst_defined_substitutions.txt $repo_directory$repo/
    echo "fix logo"
    perl -i -p0e 's/\|CyVerse logo\|_/\|CyVerse_logo\|_/smg' $repo_directory$repo/*.rst
    perl -i -p0e 's/\|CyVerse logo\| image:: .\/img\/cyverse_rgb.png/\|CyVerse_logo\| image:: .\/img\/cyverse_learning.png/smg' $repo_directory$repo/cyverse_rst_defined_substitutions.txt
    perl -i -p0e 's/_CyVerse logo: http:\/\/learning.cyverse.org\//_CyVerse_logo: http:\/\/learning.cyverse.org\//smg' $repo_directory$repo/cyverse_rst_defined_substitutions.txt
    perl -i -p0e 's/:height: 100//smg' $repo_directory$repo/cyverse_rst_defined_substitutions.txt
    echo "fix find help messages"
    perl -i -p0e 's/\*\*Fix.*Wiki\|/\*\*Fix or improve this documentation\*\*\n\n- Search for an answer:\n  \|CyVerse Learning Center\|\n- Ask us for help:\n  click \|Intercom\| on the lower right-hand side of the page\n- Report an issue or submit a change:\n  \|Github Repo Link\|\n- Send feedback: `Tutorials\@CyVerse.org <Tutorials\@CyVerse.org>`_\n/smg' $repo_directory$repo/*.rst
    perl -i -p0e 's/Search.*Wiki\|//smg' $repo_directory$repo/*.rst
    perl -i -p0e 's/\*\*Fix.*org>`_/\*\*Fix or improve this documentation\*\*\n\n- Search for an answer:\n  \|CyVerse Learning Center\|\n- Ask us for help:\n  click \|Intercom\| on the lower right-hand side of the page\n- Report an issue or submit a change:\n  \|Github Repo Link\|\n- Send feedback: `Tutorials\@CyVerse.org <Tutorials\@CyVerse.org>`_\n/smg' $repo_directory$repo/*.rst
    perl -i -p0e 's/Search for an answer.*wiki.cyverse.org>`_//smg' $repo_directory$repo/*.rst
    perl -i -p0e 's/Post your question to the user forum.*questions>`_//smg' $repo_directory$repo/*.rst
    echo "fix version numbers and copyright year in config files"
    perl -i -p0e "s/version = \'1.0\'/version = \'2.0\'/smg" $repo_directory$repo/conf.py
    perl -i -p0e "s/release = \'1.0\'/version = \'2.0\'/smg" $repo_directory$repo/conf.py
    perl -i -p0e "s/copyright = \'2019,/copyright = \'2020,/smg" $repo_directory$repo/conf.py
    perl -i -p0e "s/copyright = \'2018,/copyright = \'2020,/smg" $repo_directory$repo/conf.py
    perl -i -p0e "s/copyright = \'2017,/copyright = \'2020,/smg" $repo_directory$repo/conf.py
    perl -i -p0e "s/version = \'1.0\'/version = \'2.0\'/smg" $repo_directory$repo/misc/cyverse_sphinx_conf.py
    perl -i -p0e "s/release = \'1.0\'/version = \'2.0\'/smg" $repo_directory$repo/misc/cyverse_sphinx_conf.py
    perl -i -p0e "s/copyright = \'2019,/copyright = \'2020,/smg" $repo_directory$repo/misc/cyverse_sphinx_conf.py
    perl -i -p0e "s/copyright = \'2018,/copyright = \'2020,/smg" $repo_directory$repo/misc/cyverse_sphinx_conf.py
    perl -i -p0e "s/copyright = \'2017,/copyright = \'2020,/smg" $repo_directory$repo/misc/cyverse_sphinx_conf.py
    echo "if needed add calls to css and js to cyverse_sphinx_conf.py"
    grep -qxF "    app.add_stylesheet('cyverse.css')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_stylesheet('cyverse.css')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    grep -qxF "    app.add_stylesheet('detail-expand.css')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_stylesheet('detail-expand.css')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    grep -qxF "    app.add_stylesheet('question-answer.css')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_stylesheet('question-answer.css')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    grep -qxF "    app.add_javascript('cyverse.js')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('cyverse.js')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    grep -qxF "    app.add_javascript('detail-expand.js')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('detail-expand.js')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    grep -qxF "    app.add_javascript('question-answer.js')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('question-answer.js')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    grep -qxF "    app.add_javascript('intercom-script-for-learning.js')" $repo_directory$repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('intercom-script-for-learning.js')" >> $repo_directory$repo/misc/cyverse_sphinx_conf.py
    echo "make the first HTML build for you to preview"
    cd $repo_directory$repo && make html
    cd ..
done < repos.txt
rm repos.txt
