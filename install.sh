#!/bin/bash

(
GLOBIGNORE=.:..:.DS_Store
shopt -s dotglob
ln -sfn $PWD/src/* ~/ 
)
