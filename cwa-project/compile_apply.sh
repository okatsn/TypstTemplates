#!/bin/bash

output_file="project_plan.pdf"

typst compile --pages 2- apply.typ $output_file
