#!/bin/bash
module=$1
for file in `grep -Ril  *`; do 
  echo "renaming  to $module in $file"
  sed -i"bak" "s//$module/g" $file;
  rm -rf $file.bak
done

if [ -d  ]; then
  echo "renaming director  to $module"
  mv  $module
fi
