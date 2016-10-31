#!/bin/bash
module=$1
for file in `grep -Ril qube_base *`; do 
  echo "renaming qube_base to $module in $file"
  sed -i "s/qube_base/$module/g' $file;
done

if [ -d qube_base ]; then
  echo "renaming director qube_base to $module"
  mv qube_base $module
fi
