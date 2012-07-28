read -d '' help <<- EOF
	usage: up [--help][-n LEVELS|--level=LEVELS][--version][basename]...

	Report bugs to: <https://github.com/helpermethod/up/issues>
	up home page: <https://github.com/helpermethod/up>
EOF

version=1.0.0
positive_number='^(0|[1-9][0-9]*)$'

up() {
	if (($# == 0)); then
		_up 1
		return $?
	fi

	case $1 in
		-n | --level)
			_up "$2"

			return $?
			;;
		--level=*)
			local levels=${1#*=}

			_up "$levels"

			return $?
			;;
		--help)
			printf '%s\n' "$help"

			return 0
			;;
		--version)
			printf '%s\n' "$version"

			return 0
			;;
		--)
			;;
		-*)
			return 2
			;;
	esac

	local result=$PWD

	[[ $PWD = '/' ]] && local result='/' || local result=$PWD/

	for basename; do
		[[ $result = '/' ]] && return 3

		if [[ $basename = '/' ]]; then
			result='/'
		else
			result=${result%/$basename/*}/$basename
		fi
	done

	[[ ! -d $result ]] && return 3
	[[ ! -x $result ]] && return 4

	cd "$result"
}

_up() {
	local levels=$1

	[[ ! $levels =~ $positive_number ]] && return 1

	[[ $PWD = '/' ]] && local result='/' || local result=$PWD/

	for ((level = 0; level < levels; ++level)); do
		[[ $result = '/' ]] && return 3

		result=${result%/*/}/
	done

	[[ ! -x $result ]] && return 4

	cd "$result"
}