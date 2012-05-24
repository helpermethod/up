up() {
  if (($# == 0)); then
    cd ..
    return 0
  fi

  local result=$PWD

  for basename; do
    result=${result%/$basename/*}/$result
  done

  [[ -d $result ]] || return 1

  cd "$result"
}