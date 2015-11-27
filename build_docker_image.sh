#!/bin/bash

default_image_name="aungzy/java"
default_tag="oracle-jdk7-ubuntu"
default_build_path="."

[[ -z "$1" ]] && image_name="$default_image_name" || image_name="$1"
[[ -z "$2" ]] && tag="$default_tag" || tag="$2"
[[ -z "$3" ]] && build_path="$default_build_path" || build_path="$3"

echo
echo "Build parameters:"
echo "    image_name = \"$image_name\""
echo "    tag = \"$tag\""
echo "    build_path = \"$build_path\""

build_cmd="docker build -t $image_name:$tag \"$build_path\""

echo "Executing build command:"
echo "    \`$build_cmd\`"
echo

bash -c "$build_cmd"
