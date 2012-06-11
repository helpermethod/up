read -d '' help <<- EOF
	usage: up [--help][--version][basename]...

	Report bugs to: <https://github.com/helpermethod/up/issues>
	up home page: <https://github.com/helpermethod/up>
EOF

up() {
	if (($# == 0)); then
		cd ..

		return 0
	fi

	case $1 in
		-n | --level)
      [[ $2 =~ ^([1-9][0-9]*|0)$ ]] && return 1

			if ((levels == 1)); then
				cd ..

				return 0
			fi

			_up $2 

			return 0
			;;
		--level=*)

			;;
		--help)
			echo "$help"

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

_up() {
	local result=$PWD

	for level in {1..$1}; do
		result=${result%/*}/
	done

  cd "$result"
}