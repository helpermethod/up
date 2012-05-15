up() {
  if (($# == 0)); then
    cd ..
    return 0
  fi

  for basename; do
    local result=$(_cut_off_part_after_basename "$basename")
    cd $result
  done
}

_cut_off_part_after_basename() {
  echo "${PWD%/$basename/*}/$basename"
}
