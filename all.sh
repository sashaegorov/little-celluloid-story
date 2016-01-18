#!/usr/bin/env bash
# Clean up
rm README.md

function escape_path {
  sed -e 's|/|\\\/|g'
}

function strip_rvm_path {
  _path=`echo ${HOME}/.rvm/gems/.\*/gems/ | escape_path`
  sed -e "s|${_path}||g"
}

for rb in stories/??_*.rb; do
  ruby ${rb} 2>&1 | strip_rvm_path >> README.md
done
