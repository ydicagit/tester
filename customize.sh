#!/bin/bash
module=$1
for file in `grep -Ril  * | grep -v customize.sh`; do 
  echo "renaming  to $module in $file"
  sed -i"bak" "s/qube_base/$module/g" $file;
  rm -rf $file.bak
done

if [ -d  ]; then
  echo "renaming directory qube_base  to $module"
  mv  $module
fi
