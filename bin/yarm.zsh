# yet another rm by hayamiz
function rm(){
  for file in $*
  do
    __rm_single_file $file
  done
}

function __rm_single_file(){
  if ! [ -d ~/.Trash/ ]
  then
    command /bin/mkdir ~/.Trash
  fi

  if ! [ $# -eq 1 ]
  then
    echo "__rm_single_file: 1 argument required but $# passed."
    exit
  fi

  if [ -e $1 ]
  then
    BASENAME=`basename $1`
    NAME=$BASENAME
    COUNT=0
    while [ -e ~/.Trash/$NAME ]
    do
      COUNT=$(($COUNT+1))
      NAME="$BASENAME.$COUNT"
    done

    command /bin/mv $1 ~/.Trash/$NAME
  else
    echo "No such file or directory: $file"
  fi
}
