#!/bin/bash

case "$#" in
  1)  #standard /say
    for i in "$@"; do
    all="$all$i "
    done
    $(dirname $0)/minecraft_svc command "say $all"
    exit 1
    ;;
  2)  #pm or flags depending on usage of -flags
    if [[ ${1:0:1} == "-" ]]; then 
      for (( i=0; i<${#1}; i++ )); do
        flag="${1:$i:1}"
        # case "$flag" in
          # a)
          # ;;
          # b)
          # ;;
          # c)
          # ;;
          # u)
          # ;;
        # esac
      done
    else
      MSG="$2"
      ME=`whoami`
      cmd="tellraw $1 [{'text':'$ME@console tells you: $2',color:'gray',italics:true}]"
      $(dirname $0)/minecraft_svc command "$cmd"
      exit 1    
    fi
    
    ME=`whoami`
    cmd="tellraw @a {'text':'','extra':[{'text':'['},{'text':'$ME@console','color':'green'},{'text':'] $all'}]}"
    $(dirname $0)/minecraft_svc command "$cmd"
    exit 1    
    ;;
  3)  #unsure
    ;;
  *)  #other
    echo "Usage: $0 [player|-flags] [quoted_message]"
esac
exit 0