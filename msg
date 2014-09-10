#!/bin/bash

case "$#" in
  1)  #standard /say
    for i in "$@"; do
    all="$all$i "
    done
    /etc/init.d/minecraft command "say $all"
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
      CMD="tellraw $1 [{'text':'$ME@console tells you: $2',color:'gray',italics:true}]"
      /etc/init.d/minecraft command "$CMD"
      exit 1    
    fi
    
    ME=`whoami`
    CMD="tellraw @a {'text':'','extra':[{'text':'['},{'text':'$ME@console','color':'green'},{'text':'] $all'}]}"
    /etc/init.d/minecraft command "$CMD"
    exit 1    
    ;;
  3)  #unsure
    ;;
  *)  #other
    echo "Usage: $0 [player|-flags] [quoted_message]"
esac
exit 0