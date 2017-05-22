#!/bin/bash

while read sizing
do
  rows=$(echo $sizing | sed 's/x.*//')
  columns=$(echo $sizing | sed 's/.*x//')
  height="$rows"0
  width="$columns"0

  while read palette_line
    do
     colour_desc=$(echo $palette_line | sed 's/:.*//') 
     order=$(echo "$sizing"_"$colour_desc")
     palette=$(echo $palette_line | sed 's/.*://;s/,/ /g')

     ruby gen.rb --width "$width" --height "$height" --rows "$rows" --columns "$columns" --order "$order" --palette "$palette"
       
    done < palette_list

done < size_list

# mv sample_* samples
