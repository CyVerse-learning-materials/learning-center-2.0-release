# 2.0 Release css/js/config files

In this repo are some configuration files needed to bring existing repos to
the Learning Center 2.0 spec.  

This repo contains a master list of URLs that all CyVerse learning materials can
pull from.


## 2.0 Upgraded Files 

|file|Notes|Location to place in the target repo (relative to top level directory)|
|----|-----|------------------------------------|
|`triage-for-2-0-release.md`|This is a github template for issues. When the repo is ready to be evaluted for 2.0, an issue should be created using this emplate.|`./github/ISSUE_TEMPLATE/triage-for-2-0-release.md`|
|`cyverse.css`|Repo css|`misc/static/cyverse.css` |
|`cyverse.js`|Repo js|`misc/static/cyverse.js`|
|`detail-expand.css` |Repo css|`misc/static/detail-expand.css`|
|`intercom-script-for-learning.js`|Intercom js|`misc/static/intercom-script-for-learning.js`|
|`question-answer.js`|Q&A js|`misc/static/question-answer.js`|
|`jquery.min.js`|Repo css|`misc/static/jquery.min.js`|
|`cyverse_spinx_conf.py`\*|sphinx config file|`misc/cyverse_spinx_conf.py`|
|`conf.py`\*|sphinx config|`conf.py`|
|`cyverse_rst_defined_substitutions.txt`|list of URLS|`cyverse_rst_defined_substitutions.txt`|
|`custom_urls.txt`\*|repo-specific of URLS|`custom_urls.txt`|
|`README.md`\*|Project Readme|`README.md`|

\* - These files may have some project-specific features so you should not automatically copy over existing files. 



### upgrading a repo to 2.0 

In many cases you can atomatically upgrade an existing repo to the 2.0 spec. Here are the steps. 

1. Clone this repo to a location on your computer (e.g. `~/local_cyverse_learning_center`)

       cd ~/local_cyverse_learning_center
       git clone 




## How to use for maintain links in your CyVerse learning materials

CyVerse uses [RestructuredText](https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html) (RST)
to build documentation. To add links within your documentation, RST allows you
a few ways, but the preferred way is to use a [substitution](https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#substitution-definitions). Combined with the [include](https://docutils.sourceforge.io/docs/ref/rst/directives.html#including-an-external-document-fragment) directive we can have a single page with all the URLs for links in the documentation. If a link changes, this means you can update a single page and fix the link everywhere it appears.

### Steps

1. CyVerse [documentation templates](https://github.com/CyVerse-learning-materials) contain the directive (if you don't have this line add it)

       .. include:: cyverse_rst_defined_substitutions.txt

2. Your documentation template should also contain the file `cyverse_rst_defined_substitutions.txt`

3. As you create your documentation, add your URLs to the
       `cyverse_rst_defined_substitutions.txt` file in this format

       .. |LINK TITLE| raw:: html

         <a href="https://link.url/" target="_blank">LINK TITLE</a>


4. When you are writing your documentation, enter links by using the link title
   you have specified surrounded with the `|` character, i.e.

       |LINK TITLE|


### Tips and adding to this master file


1. Unfortunately all repos cannot automatically copy from this master file. If the `cyverse_rst_defined_substitutions.txt` file in this repo is newer than the one in your template, you will need to manually copy it. We will update the templates on a regular basis.

2. When adding to the `cyverse_rst_defined_substitutions.txt` file in this repo try to keep this alphabetical.
