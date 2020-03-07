#!/usr/bin/bash

# Set important variables
export SRCDIR="LeryPosesGolden/dataset"
export DSTDIR="dataset"

# Remove destination directory to recreate the dataset from scratch
rm -r -f $DSTDIR
mkdir $DSTDIR

# For each class, copy all images in tmp/<class>
# Then, create training, validation, test and remainder sub-folders
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
