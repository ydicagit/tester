#!/bin/bash
module=$1
repo=$2
sonar_key=$3

for file in `grep -Ril qube_placeholder * | grep -v customize.sh`; do 
  echo "renaming  qube_placeholder to $module in $file"
  sed -i".bak" "s/qube_base/$module/g" $file;
  rm -rf $file.*bak*
done
for file in `grep -Ril QUBE_SONAR_KEY * | grep -v customize.sh`; do 
  echo "renaming  QUBE_SONAR_KEY to $sonar_key in $file"
  sed -i".bak" "s/QUBE_SONAR_KEY/$sonar_key/g" $file;
  rm -rf $file.*bak*
done
for file in `grep -Ril qube_repo * | grep -v customize.sh`; do 
  echo "renaming  qube_repo to $repo in $file"
  sed -i".bak" "s/qube_repo/$repo/g" $file;
  rm -rf $file.*bak*
done