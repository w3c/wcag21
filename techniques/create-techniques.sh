#!/bin/bash
echo cp technique-template.html ../../technique-template.html
echo cd ..
while [ $# -gt 0 ]
do
  echo git checkout --orphan tech-$2
  echo git rm -rf .
  echo cp ../technique-template.html techniques/$1/$2.html
  echo sed -i "s/Technique Title/$3/g" techniques/$1/$2.html
  echo git add .
  echo git commit -m "Set up $2 technique"
  echo git push --set-upstream origin tech-$2
  shift
  shift
  shift
done
echo rm ../technique-template.html
echo git checkout technique-setup