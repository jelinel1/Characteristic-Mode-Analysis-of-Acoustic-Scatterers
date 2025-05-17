#!/bin/bash

cuda_computecapability=(3.0 3.5 3.7 5.0 5.2 6.0 6.1 7.0 7.5 8.0 8.6)
cuda_arch=(30 35 37 50 52 60 61 70 75 80 86)
files=(symmetrize transpose)

for item in ${cuda_computecapability[*]}
do
  rm -r $item
  mkdir $item
done

for index in ${!cuda_arch[*]}
do
  for file in ${files[*]}
  do
    nvcc -ptx --gpu-architecture=compute_${cuda_arch[$index]} $file.cu -o ./${cuda_computecapability[$index]}/$file.ptx
  done
done
