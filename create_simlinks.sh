#!/bin/bash

# list of files to symlink
file_list=(
  .vimrc 
  .sample
)

symlink_to_home() {
  home_file=~/$1
  if [ -f $home_file ]; then
    echo "-- matched: $home_file, writing backup to $home_file.bak;"
    mv $home_file $home_file.bak
  fi
  echo "-- creating symlink for $1 at $home_file;"
  ln -s $(pwd)/$1 $home_file
}

echo "- creating symlinks"
for i in "${file_list[@]}"; do
  symlink_to_home $i;
done
