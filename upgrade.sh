

#!/bin/bash


# get list of repo folders to upgrade
input="repos.txt"
while IFS= read -r line
do
 for repo in $line
 do
  echo "Upgrading" $line
  mkdir -p $repo/./github/ISSUE_TEMPLATE/
  echo "Copying 1 of 10 - triage-for-2-0-release.md to" $line
  cp learning-center-2.0-release/triage-for-2-0-release.md $repo/./github/ISSUE_TEMPLATE/
  echo "Copying 2 of 10 - cyverse.css to" $line
  cp learning-center-2.0-release/cyverse.css $repo/misc/static/
  echo "Copying 3 of 10 - cyverse.js to" $line
  cp learning-center-2.0-release/cyverse.js $repo/misc/static/
  echo "Copying 4 of 10 - detail-expand.css to" $line
  cp learning-center-2.0-release/detail-expand.css $repo/misc/static/
  echo "Copying 5 of 10 - intercom-script-for-learning.js to" $line
  cp learning-center-2.0-release/intercom-script-for-learning.js $repo/misc/static/
  echo "Copying 6 of 10 - question-answer.js to" $line
  cp learning-center-2.0-release/question-answer.js $repo/misc/static/
  echo "Copying 7 of 10 - jquery.tablesorter.min.js to" $line
  cp learning-center-2.0-release/jquery.tablesorter.min.js $repo/misc/static/
  echo "Copying 8 of 10 - custom_urls.txt to" $line
  cp learning-center-2.0-release/custom_urls.txt $repo/
  echo "Copying 9 of 10 - cyverse_learning.png to" $line
  cp learning-center-2.0-release/img/cyverse_learning.png $repo/img/cyverse_learning.png
  echo "Copying 10 of 10 - intercom.png to" $line
  cp learning-center-2.0-release/img/intercom.png $repo/img/intercom.png
  echo "fix logo"
  perl -i -p0e 's/\|CyVerse logo\|_/\|CyVerse_logo\|_/smg' $repo/*.rst
  perl -i -p0e 's/\|CyVerse logo\| image:: .\/img\/cyverse_rgb.png/\|CyVerse_logo\| image:: .\/img\/cyverse_learning.png/smg' $repo/cyverse_rst_defined_substitutions.txt
  perl -i -p0e 's/_CyVerse logo: http:\/\/learning.cyverse.org\//_CyVerse_logo: http:\/\/learning.cyverse.org\//smg' $repo/cyverse_rst_defined_substitutions.txt
  perl -i -p0e 's/:height: 100//smg' $repo/cyverse_rst_defined_substitutions.txt
  echo "fix find help messages"
  perl -i -p0e 's/\*\*Fix.*Wiki\|/\*\*Fix or improve this documentation\*\*\n\n- Search for an answer:\n  \|CyVerse Learning Center\|\n- Ask us for help:\n  click \|Intercom\| on the lower right-hand side of the page\n- Report an issue or submit a change:\n  \|Github Repo Link\|\n- Send feedback: `Tutorials\@CyVerse.org <Tutorials\@CyVerse.org>`_\n/smg' $repo/*.rst
  perl -i -p0e 's/Search.*Wiki\|//smg' $repo/*.rst
  perl -i -p0e 's/\*\*Fix.*org>`_/\*\*Fix or improve this documentation\*\*\n\n- Search for an answer:\n  \|CyVerse Learning Center\|\n- Ask us for help:\n  click \|Intercom\| on the lower right-hand side of the page\n- Report an issue or submit a change:\n  \|Github Repo Link\|\n- Send feedback: `Tutorials\@CyVerse.org <Tutorials\@CyVerse.org>`_\n/smg' $repo/*.rst
  perl -i -p0e 's/Search for an answer.*wiki.cyverse.org>`_//smg' $repo/*.rst
  perl -i -p0e 's/Post your question to the user forum.*questions>`_//smg' $repo/*.rst
  echo "fix version numbers and copyright year in config files"
  perl -i -p0e "s/version = \'1.0\'/version = \'2.0\'/smg" $repo/conf.py
  perl -i -p0e "s/release = \'1.0\'/version = \'2.0\'/smg" $repo/conf.py
  perl -i -p0e "s/copyright = \'2019,/copyright = \'2020,/smg" $repo/conf.py
  perl -i -p0e "s/copyright = \'2018,/copyright = \'2020,/smg" $repo/conf.py
  perl -i -p0e "s/copyright = \'2017,/copyright = \'2020,/smg" $repo/conf.py
  perl -i -p0e "s/version = \'1.0\'/version = \'2.0\'/smg" $repo/misc/cyverse_sphinx_conf.py
  perl -i -p0e "s/release = \'1.0\'/version = \'2.0\'/smg" $repo/misc/cyverse_sphinx_conf.py
  perl -i -p0e "s/copyright = \'2019,/copyright = \'2020,/smg" $repo/misc/cyverse_sphinx_conf.py
  perl -i -p0e "s/copyright = \'2018,/copyright = \'2020,/smg" $repo/misc/cyverse_sphinx_conf.py
  perl -i -p0e "s/copyright = \'2017,/copyright = \'2020,/smg" $repo/misc/cyverse_sphinx_conf.py
  echo "add needed calls to css and js to cyverse_sphinx_conf.py"
  grep -qxF "    app.add_stylesheet('cyverse.css')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_stylesheet('cyverse.css')" >> $repo/misc/cyverse_sphinx_conf.py
  grep -qxF "    app.add_stylesheet('detail-expand.css')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_stylesheet('detail-expand.css')" >> $repo/misc/cyverse_sphinx_conf.py
  grep -qxF "    app.add_stylesheet('question-answer.css')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_stylesheet('question-answer.css')" >> $repo/misc/cyverse_sphinx_conf.py
  grep -qxF "    app.add_javascript('cyverse.js')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('cyverse.js')" >> $repo/misc/cyverse_sphinx_conf.py
  grep -qxF "    app.add_javascript('detail-expand.js')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('detail-expand.js')" >> $repo/misc/cyverse_sphinx_conf.py
  grep -qxF "    app.add_javascript('question-answer.js')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('question-answer.js')" >> $repo/misc/cyverse_sphinx_conf.py
  grep -qxF "    app.add_javascript('intercom-script-for-learning.js')" $repo/misc/cyverse_sphinx_conf.py || echo "    app.add_javascript('intercom-script-for-learning.js')" >> $repo/misc/cyverse_sphinx_conf.py
  echo "make the first HTML build for you to preview"
  cd $repo && make html
 done
done < "$input"
