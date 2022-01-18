#!/bin/bash

# <prog>1 -->    This is compiler-generated (generally AVX512)
# <prog>2 -->    This is forced AVX-512 (knl flag)
# <prog>_rex --> This is Rex generated
#
# Param 1- the program being run
function run_intel() {
    ./$1/$1 >> intel_explicit.csv
    echo "," >> intel_explicit.csv
}

# Run
cd build

for d in ./*/
do
    CURRENT=`basename $d`
    echo $CURRENT
    run_intel $CURRENT
done

cd ..
echo "Done"