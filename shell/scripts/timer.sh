#!/bin/bash

for i in $(tree /home/john);
do echo ${i};
done

# tree / > log.txt
