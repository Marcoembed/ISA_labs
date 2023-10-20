#! /bin/sh
# @param 1 is the config file path for vsg
# @param 2 is the file path that will be lint with vsg
# @param 3 [optional|--fix] is the opration to do vsg: nothing = check, --fix = fix the file

COMMAND="vsg"
echo $(pwd)

if ! which $COMMAND >/dev/null ; then
  echo "Error: vsg not found";
  exit 1
fi
if [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo "Usage: $(basename $0) [-h|--help] | {vsg_config_json_path file_path_to_lint [fix] }"
  exit 0
fi

if [ $# -lt 2 ]; then
  echo "Error: not enough parameters"
  exit 1
fi

VSG_CNFG_FILE_PATH="$1"
echo " * Vsg config path:  $VSG_CNFG_FILE_PATH"

if [ ! -f "$VSG_CNFG_FILE_PATH" ]; then
  echo "Error: missing vsg config";
  exit 1
fi


VSG_OPTIONS="--style jcl --jobs 6 "

FILE_PATH=$2

FIX=""
if [ $# -eq 3 ]; then
  if [ $3 = "fix" ]; then
    FIX="--fix" 
  else
    echo "Error: Third parameter not valid"
    exit 1
  fi
fi


EXEC="$COMMAND --filename $FILE_PATH --configuration $VSG_CNFG_FILE_PATH $FIX $VSG_OPTIONS"
echo " * Executing:     $EXEC"
eval $EXEC
