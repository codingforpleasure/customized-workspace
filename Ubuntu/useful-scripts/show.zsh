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
NUM_ITERATIONS=$((NUM_OF_IMAGES / TOTAL_PRESENTED_IN_GRID + 1))
FILE_EXTENTION=${3:-png}
THRESHOLD_WIDTH=60

FILE=(*.${FILE_EXTENTION})
SINGLE_IMAGE_WIDTH=$(identify -ping -format '%w' ${FILE})

if [[ $SINGLE_IMAGE_WIDTH -lt $THRESHOLD_WIDTH ]]; then
	SINGLE_IMAGE_WIDTH=100
fi

SINGLE_IMAGE_HEIGHT=$(identify -ping -format '%h' ${FILE})
PADDING_FIXED_WIDTH=$(( $GRID_NUM_COLUMNS*20 ))
FIXED_WIDTH=$(( $SINGLE_IMAGE_WIDTH * $GRID_NUM_COLUMNS + $PADDING_FIXED_WIDTH + 100))
FIXED_HEIGHT=$(( $SINGLE_IMAGE_HEIGHT * ($GRID_NUM_ROWS + 1) + 200  )) # Padding since I'm keeping space for captions
FILENAME=$(echo montage-"$(date +"%T").png" | tr : -)

colorful_echo yellow "A thumbnail file was exported: ${FILENAME}"

# Implementing a Sliding window for passing the corresoponding files to feh

echo $NUM_ITERATIONS
for (( i = 0; i <= $NUM_ITERATIONS; i++ )); do
	TAIL_LIST_LENGTH=$(( ${NUM_OF_IMAGES} - ${i}*${TOTAL_PRESENTED_IN_GRID} ))
	LIST_OF_FILES=$( ls | tail -n ${TAIL_LIST_LENGTH} | head -n ${TOTAL_PRESENTED_IN_GRID} )

	feh --index \
		--recursive \
		--multiwindow \
		--thumb-width "${SINGLE_IMAGE_WIDTH}" \
		--thumb-height "${SINGLE_IMAGE_HEIGHT}"  \
		--limit-width "${FIXED_WIDTH}" \
		--limit-height "${FIXED_HEIGHT}" \
		#--output "./${FILENAME}"
		${LIST_OF_FILES} &

done
