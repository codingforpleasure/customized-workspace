#!/bin/bash

DRIVE_NAME="KINGSTON"
DIR_NAME="/media/${USER}/${DRIVE_NAME}"

if [[ ! -d "${DIR_NAME}" ]]; then
 	echo "${DRIVE_NAME} drive was not found, so backup was not accomplished."
 	return 1
fi

echo "Backing up files into ${DRIVE_NAME} drive..."

COMPUTER_NAME=`/bin/hostname`
DST="${DIR_NAME}/backup-${COMPUTER_NAME}"

/usr/bin/rsync	--archive \
				--verbose \
				--update  \
				--human-readable \
				--progress \
				~/my_documentation_helper ~/myGitRepositories ~/PycharmProjects ~/AndroidStudioProjects
				"${DIR_NAME}/backup-${COMPUTER_NAME}"
