#!/bin/bash

# The user can give an input, points, radius, or output file

iter=3      # Number of iterations (depth)
points=14   # Number of points
radius=1.14 # Factor of expansion/compression
outfile="mandala.png"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -i|--iter)
    shift
    iter="$1"
    shift
    ;;
    -rs|--rstudio)
    shift
    exec /init
    shift
    ;;
    -p|--points)
    shift
    points="$1"
    shift
    ;;
    -r|--radius)
    shift
    radius="$1"
    shift
    ;;
    -o|--outfile)
    shift
    outfile="$1"
    shift
    ;;
    *)
    echo "Unknown option $key"
    shift # past argument
    ;;
esac
done

echo iter    = "${iter}"
echo radius  = "${radius}"
echo points  = "${points}"
echo outfile = "${outfile}"

Rscript entrypoint.R $iter $radius $points "/data/$outfile"
