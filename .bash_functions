up() {
  if (($# == 0)); then
    cd ..
    return 0
  fi

  for basename; do
    local result=$(_foo "$basename")
    cd $result
  done
}

_foo() {
  echo "${PWD%/$basename/*}/$basename"
}
