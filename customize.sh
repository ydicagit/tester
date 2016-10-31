#!/bin/bash
module=$1
for file in `grep -Ril qube_base * | grep -v customize.sh`; do 
  echo "renaming  to $module in $file"
  sed -i"bak" "s/qube_base/$module/g" $file;
  rm -rf $file.bak
done

if [ -d qube_base ]; then
  echo "renaming directory qube_base  to $module"
  mv qube_base $module
fi
