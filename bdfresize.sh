#!/usr/bin/env bash

type bdfresize > /dev/null 2>&1 || {
    echo 'error : install bdfresize first' >&2
    exit 1
}
# Loop through all .bdf files in the directory
for bdf_file in "$(pwd)"/*.bdf; do
  # Check if the file exists and is a regular file
  if [ -f "$bdf_file" ]; then
    # Generate the new filename with the suffix scaled.bdf
    scaled_filename="${bdf_file%.bdf}scaled.bdf"

    # Use bdfscale to resize the font and save it with the new filename
    bdfresize "$bdf_file" -f 2 > "$scaled_filename"
    
    echo "Scaled $bdf_file to $scaled_filename"
  fi
done
