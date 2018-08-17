#!/bin/zsh

GRIP="/usr/local/bin/grip"
IMG_DIR="${HOME}/myGitRepositories/customized-workspace/Ubuntu/useful-resources/images"
MD_DIRECTORY=${1:-${DOC_MD_PATH}} # DOC_MD_PATH was exported in zshrc
OUTPUT_DIR='/home/gil_diy/my_documentation_helper'

colorful_echo()
{
	  local code="\033["
		case "$1" in
					red    ) color="${code}1;31m";;
					green  ) color="${code}1;32m";;
					yellow ) color="${code}1;33m";;
					blue   ) color="${code}1;34m";;
					purple ) color="${code}1;35m";;
					cyan   ) color="${code}1;36m";;
					gray   ) color="${code}0;37m";;
					*) local text="$1"
		esac
		[ -z "$text" ] && local text="$color$2${code}0m"
		echo -e "$text"
}


if [[ ! -e "$GRIP" ]]; then
	colorful_echo red "grip package is not installed on youe system."
	exit 1
else
	colorful_echo purple "Exporting files from markdown to html"
fi

if [[ -e "$IMG_DIR" ]]; then
	colorful_echo purple "Found image directory"
	cp -r "${IMG_DIR}" "${OUTPUT_DIR}"
else
	colorful_echo purple "No directory images was found. "
fi

for MARKDOWN_FILENAME_PATH in ${MD_DIRECTORY}/*.md
do
	FILENAME=$(/usr/bin/basename ${MARKDOWN_FILENAME_PATH})
	OUTPUT_FILENAME=${FILENAME/md/html}
	OUTPUT_FULL_PATH=${OUTPUT_DIR}/${OUTPUT_FILENAME}
	${GRIP} ${MARKDOWN_FILENAME_PATH} --export ${OUTPUT_FULL_PATH}
done
