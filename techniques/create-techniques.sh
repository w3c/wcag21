#!/bin/bash
echo cp technique-template.html ../../technique-template.html
echo cd ..
while [ $# -gt 0 ]
do
  echo git checkout --orphan $2
  echo git rm -rf .
  echo cp ../technique-template.html $1/$2.html
  shift
  shift
done