# defined_substitutions

This repo contains a master list of URLs that all CyVerse learning materials can
pull from.

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
