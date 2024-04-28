#!/usr/bin/env bash

export STYLESHEETS='_styles/ifmo-common.yaml _styles/ifmo-practice-report.yaml'
export TEMPLATE='_templates/ifmo-practice-report.tmpl'
./rst2pdf.sh ./ifmo-practice-report.rst
