#!/bin/bash
function usage {
echo "
Usage: $0 [-h|-a|[-s] new-article-name]

A tool to help scafolding new articles

Options:
  -h, --help     Just shows this without creating nothing else
  -a, --advice   Just shows advice without creating nothing else
  -s, --silent   Dont show any output
"
}
# Atribute control
if [ $# -lt 1 ] || [ $# -gt 2 ] ; then
    usage
    exit 1
fi


function pre {
NAME=$(echo "$NAME_DIRT" | tr '[:upper:]' '[:lower:]' | tr '[ _]' '-')
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
mkdir -p $PATH_RESOURCES
echo "[OK]"
echo -n "- $PATH_IMAGES "
mkdir -p $PATH_IMAGES
echo "[OK]"
echo -n "- $PATH_INCLUDE "
mkdir -p $PATH_INCLUDE
echo "[OK]"
echo -n "- $PATH_ASCIIDOC "
echo ":project_id: $NAME" >> $PATH_ASCIIDOC
cat ./template/page.adoc >> $PATH_ASCIIDOC
echo "[OK]"
echo ""
}

function create_silent {
# Creating directories and files
mkdir -p $PATH_RESOURCES
mkdir -p $PATH_IMAGES
mkdir -p $PATH_INCLUDE
echo ":project_id: $NAME" >> $PATH_ASCIIDOC
cat ./template/page.adoc >> $PATH_ASCIIDOC
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
  -a|--advice)
      NAME_DIRT=$1;
      pre;
      advice;;
  -s|--silent)
      if [ $# -eq 1 ] ; then
        usage
        exit 1
      fi;
      NAME_DIRT=$2;
      pre;
      create_silent;;
  -h|--help)
      usage;
      exit 1;;
  -*)
      usage;
      exit 1;;
  *)
      NAME_DIRT=$1;
      pre;
      create;
      advice;
      post;;
esac
