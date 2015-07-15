# Copyright (C) 2012 Oliver Weiler
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

read -d '' help <<- EOF
	Usage: up [OPTION]... [BASENAME]...
	  or:  up [OPTION]... -n LEVEL
	Lore ipsum.

	Mandatory arguments to long options are mandatory for short options too.
	  -n, --level=LEVELS
	      --help          display this help and exit
	      --version       output version information and exit

	Exit status:
	 0 if OK

	Report bugs to: <https://github.com/helpermethod/up/issues>
	up home page: <https://github.com/helpermethod/up>
EOF

version_number='1.0.0'

read -d '' version <<- EOF
	up $version_number
	Copyright (C) 2012 Oliver Weiler
	License GNU GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.
EOF

positive_number='^(0|[1-9][0-9]*)$'

up() {
	if (($# == 0)); then
		__go_up_by_levels 1

		return
	fi

	case $1 in
		-n | --level)
			__go_up_by_levels "$2"

			return
			;;
		--level=*)
			__go_up_by_levels "${1#*=}"

			return
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
			printf "%s: invalid option -- '%s'\n" "$FUNCNAME" "${1#-}"
			return 1
	esac

	__go_up_by_basenames "$@"
}

__go_up_by_basenames() {
	local result
	[[ $PWD == '/' ]] && result='/' || result=$PWD/

	for basename; do
		[[ $result == '/' ]] && return 3

		if [[ $basename == '/' ]]; then
			result='/'
			continue
		fi

		# strips off trailing slash; this allows a user to pass in a basename with an
		# optional trailing slash
		basename=${basename%/}
		[[ $basename == */* ]] && return 5

		result=${result%/"$basename"/*}/$basename
	done

	[[ ! -d $result ]] && return 3
	[[ ! -x $result ]] && return 4

	cd "$result"
}

__go_up_by_levels() {
	local levels=$1

	[[ ! $levels =~ $positive_number ]] && return 2

	local result
	[[ $PWD == '/' ]] && result='/' || result=$PWD/

	for ((level = 0; level < levels; ++level)); do
		[[ $result = '/' ]] && return 3

		result=${result%/*/}/
	done

	[[ ! -x $result ]] && return 4

	cd "$result"
}
