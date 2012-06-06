up() {
  if (($# == 0)); then
    cd ..
    return 0
  fi

  case $1 in
    -n | --level)
      ;;
    --level=)
      && ((! $levels > 0)) && return 1
      return 0
      ;;
    --help)
#      echo "usage: up [--help][--version][basename]..."
#      echo
#      echo "Report bugs to: <https://github.com/helpermethod/up/issues>"
#      echo "up home page: <https://github.com/helpermethod/up>"

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

  [[ -d $result ]] || return 2

  cd "$result"
}
