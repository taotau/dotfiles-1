#!/bin/sh
res="$(~/.config/i3/volume 5 pulse)"
vol=$(echo $res | cut -d'%' -f 1)

if [ $vol -le 10 ]; then
  echo -n " "
elif [ $vol -le 50 ]; then
  echo -n " "
else
  echo -n " "
fi