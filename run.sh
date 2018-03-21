#!/bin/sh


JOBS=$(find . -name '*run.sh')

declare -a FLTRJOBS

for RGX in $@; do
  for JOB in ${JOBS[@]}; do
    if [[ "$JOB" =~ "$RGX"  ]]; then
      FLTRJOBS=( "${FLTRJOBS[@]}" "$JOB" )
    fi
  done
done

echo "list all matched jobs:"
for JOB in ${FLTRJOBS[@]}; do 
  echo "$JOB"
done
