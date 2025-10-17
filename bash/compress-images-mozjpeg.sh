#!/bin/bash

# Compress images with the mozjpeg (superset of libjpeg-turbo).
# Available command line arguments:
# -s <source-file-extension> (defaults to JPG if not defined)
# -t <output-file-extension> (defaults to jpg if not defined)
# -q <number-between-0-100>  (defaults to 85 if not defined)
#
# The images are output into the relative "Compressed" directory.
# The progress is tracked and echoed for every processed file.
# At the end, information is shown on how many images were successfully compressed.

source_ext="JPG"
output_ext="jpg"
output_dir="./Compressed"
output_suffix="-compressed"
quality=85

# Get any passed arguments
while getopts ":s:t:q:" opt; do
	case $opt in
		s)
			if [ -z "$OPTARG" ]; then
				echo "Option -s requires an argument" >&2
				exit 1
			fi
			source_ext="$OPTARG"
			;;
		t)
			if [ -z "$OPTARG" ]; then
				echo "Option -t requires an argument" >&2
				exit 1
			fi
			output_ext="$OPTARG"
			;;
		q)
			if [ -z "$OPTARG" ]; then
				echo "Option -q requires an argument" >&2
				exit 1
			fi
			case "$OPTARG" in
				''|*[!0-9]*)
					echo "Option -q requres unsigned integer value" >&2
					exit 1
					;;
			esac
			quality="$OPTARG"
			;;
		\?)
			echo "Invalid option -${OPTARG}" >&2
			exit 1
			;;
	esac
done

# Get file count with provided extension in directory
img_count=$(find . -maxdepth 1 -type f -name "*.$source_ext" -printf x | wc -c)
if [ "$img_count" -eq 0 ]; then
	echo "No files with extension .${source_ext} found at path \"$(pwd)\"" >&2
	exit 1
fi

# Create relative directory if missing
if [ ! -d "$output_dir" ]; then
	echo "Creating ${output_dir} folder"
	mkdir "$output_dir"
fi

# Compress images and track progress
i=0
for img in *.$source_ext; do
	i=$((i+1))
	echo "Processing ${img}... (${i}/${img_count})"
	cjpeg -quality "$quality" "$img" \
		> "${output_dir}/${img%.${source_ext}}${output_suffix}.${output_ext}"
done

if [ "$i" -eq "$img_count" ]; then
	echo "Image compression finished successfully"
else
	echo "Only ${i} out of ${img_count} images processed successfully" >&2
fi
