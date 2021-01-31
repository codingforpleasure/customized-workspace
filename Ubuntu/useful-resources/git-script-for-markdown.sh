#!/bin/bash


FILE=$1

toc-markdown-generate $FILE && export-all-markdowns-to-html.sh $FILE


git add $FILE && git commit -m  "$FILE documentation update" $FILE && git push
