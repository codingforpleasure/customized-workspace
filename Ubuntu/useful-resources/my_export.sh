#!/bin/zsh


MD_DIRECTORY="/home/gil_diy/customized-workspace/Ubuntu/useful-resources"

if [[ $# -eq 0 ]]; then
	
	# In case of all markdowns in the current directory

	for MARKDOWN_FILENAME_PATH in ${MD_DIRECTORY}/*.md
	do	
		DIR_COMMAND_NAME=${MARKDOWN_FILENAME_PATH:0:-3}

		generate-md --layout github \
					--input ${MARKDOWN_FILENAME_PATH}  \
					--output ${DIR_COMMAND_NAME}


		cp -rf ${DIR_COMMAND_NAME} /home/gil_diy/my_documentation_helper
		rm -rf ${DIR_COMMAND_NAME}
		#echo "mv -f ${DIR_COMMAND_NAME} /home/gil_diy/my_documentation_helper"
	done

	# Taking care of images:
	rm -rf /home/gil_diy/my_documentation_helper/images
	cp -rf /home/gil_diy/customized-workspace/Ubuntu/useful-resources/images /home/gil_diy/my_documentation_helper/

	echo "Before fix_to_images.zsh"
	cd /home/gil_diy/my_documentation_helper/
	zsh ./fix_to_images.zsh
	#zsh /home/gil_diy/my_documentation_helper/fix_to_images.zsh

	echo "After fix_to_images.zsh"
else #In case of a single file, must hold extension

	INPUT_FILE=$1 
	# INPUT_FILE=`echo $INPUT_FILE | tr [:upper:] [:upper:]`
	OUTPUT_DIR=${INPUT_FILE:0:-3}

	generate-md --layout github \
				--input ${INPUT_FILE}  \
				--output ${OUTPUT_DIR}


	cp -rf ${OUTPUT_DIR} /home/gil_diy/my_documentation_helper

	zsh /home/gil_diy/my_documentation_helper/fix_to_images.zsh

fi







