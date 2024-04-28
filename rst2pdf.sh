#!/usr/bin/env bash

STYLESHEETS="${STYLESHEETS:-_styles/ifmo-common.yaml}"

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

rst2pdf -ve preprocess \
  --stylesheets=$(join_by , $STYLESHEETS) \
  --custom-cover=${TEMPLATE} \
  -o "./results/${1/.rst/.pdf}" \
  $1
