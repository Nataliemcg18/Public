#!/bin/bash

hw_num=$(pwd | awk -F/ '{print $NF}')

cd ..
git add $hw_num
git commit -m 'submit'
git push origin master
cd $hw_num
