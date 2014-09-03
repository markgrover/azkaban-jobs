#!/bin/bash -x
if [ -n ${JOB_PROP_FILE} ] && [ -e ${JOB_PROP_FILE} ]; then
  #. ${JOB_{PROP_FILE}
  # variable value can also be parsed by the following statement. It returns the value part of validate_erros=value
  VALIDATE_ERRORS=$(grep -Po "(?<=^validate_errors=).*" $JOB_PROP_FILE)
  INPUT_BASE_DIR=$(grep -Po "(?<=^input.base.dir=).*" $JOB_PROP_FILE)
  ERRORS_BASE_DIR=$(grep -Po "(?<=^errors.base.dir=).*" $JOB_PROP_FILE)
fi

if [ -n "${VALIDATE_ERRORS}" ] && [ "${VALIDATE_ERRORS}" == "true" ]; then 
  echo "Errors found"
  java  -Xms64M -Xmx256M com.hadooparchitecturebook.MoveOutputToErrorsAction \
  ${INPUT_BASE_DIR} ${ERRORS_BASE_DIR}
else
  echo "No errors found"
  java -Xms64M -Xmx256M -Dinput.dir=${INPUT_BASE_DIR}/dataset com.hadooparchitecturebook.ProcessDataRunner \
  wordcount /user/hive/warehouse/table1/data.txt /tmp/wordcount
fi
