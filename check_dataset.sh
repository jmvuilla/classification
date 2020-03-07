#!/usr/bin/bash

# DSTDIR points to the dataset folder, containing different folders - one per class
DSTDIR=$1

# Prints number of images in different folders
for SUBDIR in $DSTDIR/*
do
    echo "Processing folder: `basename $SUBDIR`"
    for CLASS in $SUBDIR/*
    do
        N="`ls -1 $CLASS 2>/dev/null | wc -l`"
        C="`basename $CLASS`"
        printf "    Number of samples in class %-9s: " $C
        printf "%s\n" "$N"
    done
done
