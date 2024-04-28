#!/usr/bin/env bash

export STYLESHEETS='_styles/ifmo-common.yaml _styles/ifmo-report.yaml'
export TEMPLATE='_templates/ifmo-report.tmpl'
./rst2pdf.sh ./ifmo-report.rst
