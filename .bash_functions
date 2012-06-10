read -d '' usage <<- EOF
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

		;;
		--level=*)
			[[]] && return 1

			;;
		--help)
      echo "$usage"

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
