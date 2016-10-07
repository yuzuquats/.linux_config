#!/bin/bash

# creates symbolic links from src/* to ~

(
GLOBIGNORE=.:..:.DS_Store
shopt -s dotglob
ln -sfn $PWD/src/* ~/ 
)
