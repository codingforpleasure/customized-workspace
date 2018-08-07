#!/bin/bash

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


GRID_NUM_ROWS=${1:-3}     # First Argument is number of rows. Setting default to
GRID_NUM_COLUMNS=${2:-3}  # Second Argument is number of columns. Setting default to
FILE_EXTENTION=${3:-png}

FILE=(*.${FILE_EXTENTION})
SINGLE_IMAGE_WIDTH=$(identify -ping -format '%w' ${FILE})
SINGLE_IMAGE_HEIGHT=$(identify -ping -format '%h' ${FILE})

FIXED_WIDTH=$(( $SINGLE_IMAGE_WIDTH * $GRID_NUM_COLUMNS))
FIXED_HEIGHT=$(($SINGLE_IMAGE_HEIGHT * ($GRID_NUM_ROWS + 1))) # Padding since I'm keeping space for captions
FILENAME=$(echo montage-"$(date +"%T").png" | tr : -)

colorful_echo yellow "A thumbnail file was exported: ${FILENAME}"

# # --output "./${OUTPUT_DIR}/${FILENAME}"

feh --index \
	--recursive \
	--multiwindow \
	--output "./${FILENAME}" \
	--thumb-width "${SINGLE_IMAGE_WIDTH}" \
	--thumb-height "${SINGLE_IMAGE_HEIGHT}"  \
	--limit-width "${FIXED_WIDTH}" \
	--limit-height "${FIXED_HEIGHT}" \
	. &
