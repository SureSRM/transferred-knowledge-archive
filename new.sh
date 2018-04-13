#!/bin/bash
function usage {
echo "
Usage: $0 [OPTIONS] [new-article-name]

A tool to help scafolding new articles

Options:
  -h, --help     Just shows this without creating nothing else
  -a, --advice   Just shows advice without creating nothing else
  -s, --silent   Dont show any output
"
exit 1;
}
# Atribute control
if [ $# != 1 ] ; then
    usage
fi

NAME=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr '[ _]' '-')

function pre {
SPACE=$(echo "$NAME" | tr '[a-z-]' ' ' )

# Paths to the elementes to be created
PATH_RESOURCES="./src/main/resources/$NAME/"
PATH_IMAGES="./src/docs/asciidoc/images/$NAME/"
PATH_INCLUDE="./src/docs/asciidoc/include/$NAME/"
PATH_ASCIIDOC="./src/docs/asciidoc/$NAME.adoc"
}

# Defining Use Cases
function create {
# Creating directories and files
echo "Creating new article: $NAME...
"
echo -n "- $PATH_RESOURCES "
# mkdir -p $PATH_RESOURCES
echo "[OK]"
echo -n "- $PATH_IMAGES "
# mkdir -p $PATH_IMAGES
echo "[OK]"
echo -n "- $PATH_INCLUDE "
# mkdir -p $PATH_INCLUDE
echo "[OK]"
echo -n "- $PATH_ASCIIDOC "
# cp ./template/page.adoc $PATH_ASCIIDOC
echo "[OK]"
echo ""
}
function create_silent {
# Creating directories and files
echo ""
# mkdir -p $PATH_RESOURCES
# mkdir -p $PATH_IMAGES
# mkdir -p $PATH_INCLUDE
# cp ./template/page.adoc $PATH_ASCIIDOC
}

function advice {
echo "
Advices to use this platform:

./src/main/resources/$NAME/         A place to put your real sources and
$SPACE                               resources needed to follow the tutorial.
$SPACE                               Ideally they'll packed and downloaded by the
$SPACE                               user who follows it.

./src/docs/asciidoc/images/$NAME/   A place to put the images that you want to
$SPACE                               embedded into the document.

./src/docs/asciidoc/include/$NAME/  A place to put the code snippets that you
$SPACE                               want to show but arent part of the
$SPACE                               resources placed in the direcotory showed
$SPACE                               above.

./src/docs/asciidoc/$NAME.adoc      A template to strat writing whatever you
$SPACE                               want to teach

"
}

function post {
  echo "
  If you want to see this advice again, type:
    $0 -a
  "
}

# Switching behavior
case $1 in
  -a|--advice) pre; advice;;
  -h|--help) usage;;
  -s|--silent) pre; create_silent;;
  -*) usage;;
  *) pre; create; advice; post;
esac
