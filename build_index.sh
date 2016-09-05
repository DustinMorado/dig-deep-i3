#!/bin/bash
echo '#Alphabetical Index' > new_index.md
echo '' >> new_index.md

for i in *.md; do
  if [[ ${i} != 'index.md' || ${i} != 'new_index.md' ]]; then
    echo "## ${i}" >> new_index.md
    grep '###' ${i} |sort -k 2,2 | awk -v mdfile=$i '{ printf "*
    [%s](./%s#%s)\n", toupper($NF), mdfile, tolower($NF)}' >> new_index.md
  fi
done

mv new_index.md index.md
