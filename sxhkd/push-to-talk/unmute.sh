#!/bin/bash

if [[ $(amixer get Capture | grep -c "\[off\]") == 1 ]];
then
  echo "START CAPTURE";
  amixer set Capture cap;
fi;
