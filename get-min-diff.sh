#!/bin/bash

revs=$(git rev-list --all)

for r in $revs; do
  df=$(git diff --stat $r|grep changed|cut -d" " -f2)
  #TODO: there are better ways to initialized $min
  if [ -z "$min" ];then
    min=$df
    min_rev=$r
  fi

  if [ $min -gt $df ]; then
    min=$df
    min_rev=$r
    echo "$min: $r"
  fi
done
