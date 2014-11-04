#!/usr/bin/env bash

# convert a list of urls to pdf files

WKtopdf=/usr/bin/wkhtmltopdf
Output=pdfs/

while read f; do
  if [ ! -d ${Output} ]; then
    mkdir -p ${Output}
  fi
  filename=$(echo ${f} | sed 's#.*/##g')
  $WKtopdf -s Letter ${f} ${Output}${filename}.pdf
done < urls.txt
