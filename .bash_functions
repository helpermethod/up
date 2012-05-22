up() {
  if (($# == 0)); then
    cd ..
    return 0
  fi

  for basename; do
    local result="${PWD%/$basename/*}/$basename"
    cd $result
  done
}
