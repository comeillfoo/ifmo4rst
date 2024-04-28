#!/usr/bin/env bash

join_by()
{
  local delim=$1
  local string=$2

  if shift 2; then
    printf %s "$string" "${@/#/$delim}"
  fi
}

require_command()
{
    if ! command -v $1 >/dev/null 2>&1; then
        echo "$1 not found...exit"
        exit 1
    fi
}

require_command rst2pdf

STYLESHEETS=$(ls ./_styles/*.yaml)
FONTS_DIRS=/usr/share/fonts

rst2pdf -ve preprocess \
  --stylesheets=$(join_by , $STYLESHEETS) \
  --font-path=$(join_by : $FONTS_DIRS) \
  --custom-cover=_templates/"${1%%.rst}.tmpl" \
  $1
