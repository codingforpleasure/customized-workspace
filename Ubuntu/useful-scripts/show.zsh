#!/bin/bash


num_captchas=$(($(ls ./output | wc -l) + 3)) # Adding extra row
echo "num_captchas = ${num_captchas}"
num_stages=4

single_image_width=300
single_image_height=75


fixed_width=$((num_stages * single_image_width))
fixed_height=$((num_captchas * single_image_height))

echo "fixed_height = ${fixed_height}"
echo "fixed_width = ${fixed_width}"

filename=$(date +"%T").png

echo "${filename}"


feh -i --recursive --thumb-width ${single_image_width} \
		--thumb-height ${single_image_height}  \
		--limit-width "${fixed_width}" \
		--limit-height "${fixed_height}" \
		--output "${filename}" ./output_montage &

