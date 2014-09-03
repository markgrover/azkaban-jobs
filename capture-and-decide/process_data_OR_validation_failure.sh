#!/bin/bash -x
if [ -n ${JOB_PROP_FILE} ] && [ -e ${JOB_PROP_FILE} ]; then
  . ${JOB_{PROP_FILE}
  # variable value can also be parsed by the following statement. It returns the value part of validate_erros=value
  #validate_errors=$(grep -Po "(?<=^validate_errors=).*" $JOB_PROP_FILE)
fi

if [ -n "${validate_errors}" ] && [ "${validate_errors}" == "true" ]; then 
  echo "Errors found"
else
  echo "No errors found"
fi
