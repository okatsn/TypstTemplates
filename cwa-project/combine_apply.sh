#!/bin/bash

# See also: okatsn/my-workspace/shscript/gs_combine
docker run --rm \
  --volume "$(pwd):/workspace" \
  --workdir /workspace \
  --user "$(id -u):$(id -g)" \
  okatsn/my-util-box "gs -sDEVICE=pdfwrite -dSAFER -dNOPAUSE -dBATCH -sOutputFile=project_plan_combined.pdf apply_preface.pdf project_plan.pdf apply_appendix.pdf"
