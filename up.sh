#/bin/bash

if (($# == 0))
then
  cd ..
else
  for basename
  do
    cd ${PWD%$basename/*}$basename
  done
fi