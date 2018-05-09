#!/bin/bash
# $1 = technology
# $2 = filename
# $3 = type
# $4 = title
cp techniques/technique-template.html ../technique-template.html
while [ $# -gt 0 ]
do
  git checkout --orphan tech-$2
  git rm -rf .
  mkdir techniques
  mkdir techniques/$1
  cp ../technique-template.html techniques/$1/$2.html
  sed -i "s|<p id=\"technology\"></p>|<p id=\"technology\">$1</p>|" techniques/$1/$2.html
  sed -i "s|<p id=\"type\"></p>|<p id=\"type\">$3</p>|" techniques/$1/$2.html
  sed -i "s|Technique Title|$4|g" techniques/$1/$2.html
  git add techniques/$1/$2.html
  git commit -m "Set up $2 technique"
#  git push --set-upstream origin tech-$2
  shift
  shift
  shift
  shift
done
rm ../technique-template.html
git checkout technique-setup