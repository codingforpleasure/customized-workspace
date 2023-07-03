#!/usr/bin/zsh


SRC_MARKDOWN_DIR="$HOME/customized-workspace/Ubuntu/useful-resources/"
DIR_DESTINATION="generated-htmls"
DESTINTATION_FULL_PATH="$HOME/customized-workspace/Ubuntu/useful-resources/$DIR_DESTINATION"


echo "Cleaning directory."
rm  ${DESTINTATION_FULL_PATH}/*.html
rm  ${DESTINTATION_FULL_PATH}/*.md

echo "Copying all markd-down files to generated-htmls"
for md_file in ${SRC_MARKDOWN_DIR}/*.md
do
	cp ${md_file} ${DESTINTATION_FULL_PATH}
done

cd ${DESTINTATION_FULL_PATH}


for md_file in ${DESTINTATION_FULL_PATH}/*.md
do
	only_filename=$(basename $md_file)
	node convert.js $only_filename
	rm $only_filename
done
