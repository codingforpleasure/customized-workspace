#!/bin/bash

# TODO: Plans to to in the future maybe I should implement this in python,
#	    will be much easier to maintian and to code it (probably with click library).

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


NUM_OF_IMAGES=$(( $(feh -l *.png | wc -l ) -1))
GRID_NUM_ROWS=${1:-2}     # First Argument is number of rows. Setting default to 3
GRID_NUM_COLUMNS=${2:-3}  # Second Argument is number of columns. Setting default to 3
TOTAL_PRESENTED_IN_GRID=$(( $GRID_NUM_ROWS * $GRID_NUM_COLUMNS ))
NUM_ITERATIONS=$((NUM_OF_IMAGES / TOTAL_PRESENTED_IN_GRID))
FILE_EXTENTION=${3:-png}
THRESHOLD_WIDTH=60

FILE=(*.${FILE_EXTENTION})
SINGLE_IMAGE_WIDTH=$(identify -ping -format '%w' ${FILE})

if [[ $SINGLE_IMAGE_WIDTH -lt $THRESHOLD_WIDTH ]]; then
	SINGLE_IMAGE_WIDTH=100
fi

SINGLE_IMAGE_HEIGHT=$(identify -ping -format '%h' ${FILE})
FIXED_WIDTH=$(( $SINGLE_IMAGE_WIDTH * $GRID_NUM_COLUMNS ))
FILENAME=$(echo montage-"$(date +"%T").png" | tr : -)

#colorful_echo yellow "A thumbnail file was exported: ${FILENAME}"

# Implementing a Sliding window for passing the corresoponding files to feh
for (( i = 0; i < $NUM_ITERATIONS + 1; i++ )); do
	LIST_OF_FILES=""
	TAIL_LIST_LENGTH=$(( ${NUM_OF_IMAGES} - ${i}*${TOTAL_PRESENTED_IN_GRID} ))
	LIST_OF_FILES=$( ls | tail -n ${TAIL_LIST_LENGTH} | head -n ${TOTAL_PRESENTED_IN_GRID})
	echo "${LIST_OF_FILES}" > "file_list${i}.txt"
	NUM_OF_FILES=$(echo "$LIST_OF_FILES" | wc -w)
	NUM_ROWS_NEW=$(( $NUM_OF_FILES / $GRID_NUM_COLUMNS ))
	FIXED_HEIGHT=$(bc<<<"($NUM_ROWS_NEW + 2) * $SINGLE_IMAGE_HEIGHT")
	FROM_IMG_NUM=$(( ${i}*${TOTAL_PRESENTED_IN_GRID} ))
	UNTIL_IMG_NUM=$(( FROM_IMG_NUM + NUM_OF_FILES ))
	feh --index \
		--quiet \
		--recursive \
		--multiwindow \
		--thumb-width "${SINGLE_IMAGE_WIDTH}" \
		--thumb-height "${SINGLE_IMAGE_HEIGHT}"  \
		--limit-width "${FIXED_WIDTH}" \
		--limit-height "${FIXED_HEIGHT}" \
		--title "${FROM_IMG_NUM} - ${UNTIL_IMG_NUM} images from total of ${NUM_OF_IMAGES} images (Dim: ${NUM_ROWS_NEW}x${GRID_NUM_COLUMNS}) ." \
		--filelist file_list${i}.txt
		#--output "./${FILENAME}"

	rm file_list${i}.txt
done
