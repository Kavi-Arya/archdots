#!/bin/sh

theme="Gruvbox"
input=$(echo -n '' | dmenu -i -l 2 -bw 2 -fn "JetBrainsMono-Bold 20" -p "Hi, What Theme Would You Like:- ")


if test "$input" = "$theme"; then
  echo "Gruvbox"
elif test "$input" = "Nord"; then
  echo "Nord"
elif test "$input" = "Dracula"; then
  echo "Dracula"
fi


    
