#!/bin/bash

echo "abcd"
elements=`cat test.txt`
for val in $elements;
do
  if [ $val == "zaizai" ]; then
    echo "$val"
  elif [ $val == "yaa" ]; then
    echo "$val"
  else echo "end"
  fi
done

nr=`wc -l ./text.txt | awk '{print $1}'`
echo "$nr"
if [ "$nr" == "10" ]; then
    echo "rebuild text txt"
    rm text.txt
    touch text.txt
    echo "0" >> text.txt
else echo "$nr" >> text.txt
fi


