#! /bin/bash

set -e

for mode in albus roseus ruber tenebrae violaceus viridis; do
  grep -q "\.${mode}-mode" dist/liturgia.css
  grep -q "\.${mode}-mode" dist/liturgia.tailwind.css
  grep -q -- "--color-${mode}-main" dist/liturgia.tailwind.css
done

grep -q '\.prose{' dist/liturgia.tailwind.css
