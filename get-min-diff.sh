#!/bin/bash

if [ "$#" -eq 1  ]; then
  revs=$(git rev-list $1)
else
  revs=$(git rev-list --all)
fi

for r in $revs; do
  df=$(git diff --stat $r|grep changed|cut -d" " -f2)
  #TODO: there are better ways to initialized $min
  if [ -z "$min" ];then
    min=$df
    min_rev=$r
  fi

  #echo "$min -gt $df"
  if [ $min -gt $df ]; then
    min=$df
    min_rev=$r
    echo "$min: $r"
  fi
done
