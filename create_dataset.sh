#!/usr/bin/bash

# Set important variables
export SRCDIR="LeryPosesGolden/dataset"
export DSTDIR="dataset"

# Remove destination directory to recreate the dataset from scratch
rm -r -f $DSTDIR
mkdir $DSTDIR

# Copy all images (backlight & sidelight) in one folder per class
for SUBDIR in $SRCDIR/*
do
    echo "Processing folder: `basename $SUBDIR`"
    
    mkdir -p $DSTDIR/tmp/`basename $SUBDIR`
    for FILE in $SRCDIR/`basename $SUBDIR`/*
    do
        cp $FILE $DSTDIR/tmp/`basename $SUBDIR`/`basename $FILE`
    done

    mkdir -p $DSTDIR/trn/`basename $SUBDIR`
    mkdir -p $DSTDIR/val/`basename $SUBDIR`
    mkdir -p $DSTDIR/tst/`basename $SUBDIR`
    mkdir -p $DSTDIR/rem/`basename $SUBDIR`
done
