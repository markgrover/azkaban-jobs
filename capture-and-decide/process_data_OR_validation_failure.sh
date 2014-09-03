#!/bin/bash -x
if [ -n ${JOB_PROP_FILE} ] && [ -e ${JOB_PROP_FILE} ]; then
  . ${JOB_{PROP_FILE}
  # variable value can also be parsed by the following statement. It returns the value part of validate_erros=value
  #validate_errors=$(grep -Po "(?<=^validate_errors=).*" $JOB_PROP_FILE)
fi

if [ -n "${validate_errors}" ] && [ "${validate_errors}" == "true" ]; then 
  echo "Errors found"
  java  -Xms64M -Xmx256M -Dinput.dir=${input.base.dir}/dataset com.hadooparchitecturebook.MoveOutputToErrorsAction \
  ${input.base.dir} ${errors.base.dir}
else
  echo "No errors found"
  java -Xms64M -Xmx256M -Dinput.dir=${input.base.dir}/dataset com.hadooparchitecturebook.ProcessDataRunner \
  wordcount /user/hive/warehouse/table1/data.txt /tmp/wordcount
fi
