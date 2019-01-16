#!/usr/bin/zsh

# Assumption: The script recieves a file with all directory's names


function make_directories()
{
	FILE_HOLDS_DIRECTORIES_NAMES=$1

	while read DIR_NAME; do
		mkdir $DIR_NAME
	done < $FILE_HOLDS_DIRECTORIES_NAMES
}


if [ $# -lt 1 ]
then
	echo -e "\nAttention: you have not passed the filename which holds the directories names.\nexiting...\n"
	exit 1
fi

FILENAME=$1

if [ -e $1 ]
then
  echo 'Importing names from file'
  make_directories $FILENAME
else
  echo 'Could not find file: '$1
  exit 1
fi

