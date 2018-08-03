#!/bin/bash


NUM_CAPTCHAS=$(($(ls ./output_phases | wc -l) + 3)) # Adding extra row

NUM_STAGES=4

SINGLE_IMAGE_WIDTH=300
SINGLE_IMAGE_HEIGHT=75


FIXED_WIDTH=$((NUM_STAGES * SINGLE_IMAGE_WIDTH))
FIXED_HEIGHT=$((NUM_CAPTCHAS * SINGLE_IMAGE_HEIGHT))

OUTPUT_DIR="output_montage"
INPUT_DIR="output_phases"
MONTAGE_ID=$(($(ls "${OUTPUT_DIR}" | wc -l) + 1)) # Adding extra row
FILENAME="${MONTAGE_ID}-montage-"$(date +"%T").png


feh --index \
	--recursive \
	--thumb-width "${SINGLE_IMAGE_WIDTH}" \
	--output "./${OUTPUT_DIR}/${FILENAME}" \
	--thumb-height "${SINGLE_IMAGE_HEIGHT}"  \
	--limit-width "${FIXED_WIDTH}" \
	--limit-height "${FIXED_HEIGHT}" \
	output_phases &
