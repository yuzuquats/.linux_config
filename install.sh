#!/bin/bash

SOURCEDIR="src"

(
cd $SOURCEDIR
GLOBIGNORE=.:..:.DS_Store
PARENTDIR=${PWD#${HOME}/}

for file in *; do
    if [[ -d $file ]]; then
	    ln -sfh $PARENTDIR/$file ${HOME}/${file##*/}
    elif [[ -f $file ]]; then
        ln -f $file ${HOME}/${file##*/}
    else
        echo "invalid file type"
    fi
done
)
