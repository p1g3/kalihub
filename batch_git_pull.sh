#!/bin/bash

read -p "Enter folder path > " folder_path
cd "${folder_path}"
find . -maxdepth 1 -type d ! -path . | xargs -L 1 bash -c 'cd "$0" \
  && pwd && git pull'