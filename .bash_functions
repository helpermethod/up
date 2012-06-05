up() {
  if (($# == 0)); then
    cd ..
    return 0
  fi

  case $1 in
    -n | --level)
      return 0
      ;;
    --level=)
      return 0
      ;;
    --help)
      return 0
      ;;
    --version)
      return 0
      ;;
    -*)
      ;;
  esac

  local result=$PWD

  for basename; do
    result=${result%/$basename/*}/$basename
  done

  [[ -d $result ]] || return 1

  cd "$result"
}
