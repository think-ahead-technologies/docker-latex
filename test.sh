#!/bin/bash -e

cd $(dirname $0)/test

# Verify that a file can actually be compiled to PDF.
echo "X" | xelatex -shell-escape ./test.tex

pdftotext test.pdf

echo -e "\nPDF file created. Scanning contents..."
for search in "Some téxt hęre." "Sample LATEX section" "Subtitle in italics" "Figure 1: Sample SVG image"; do
  grep "$search" test.txt >/dev/null \
    || (echo "Text not found: $search" >&1 && exit 1)
done
echo "Contents verified."
