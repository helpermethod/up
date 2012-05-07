up() {
  if (($# == 0)); then
    cd ..
  else
    for basename; do
      local result=$(_foo "$basename")
      cd $result
    done
  fi
}

_foo() {
  echo ${PWD%/$basename/*}/$basename
}