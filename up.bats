@test 'when given no arguments should switch to the parent directory' {
	# given
	source up

	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	# when
	up

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/src/main" ]]
}

@test 'when given a basename should switch to the parent directory with that basename' {
	# given
	source up

	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	# when
	up src

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/src" ]]
}

@test 'when given / as its argument should switch to the root directory' {
	# given
	source up

	cd "${BATS_TEST_TEMPDIR}"

	# when
	up /

	# then
	[[ $PWD == / ]]
}

@test 'when given a basename should switch to the first parent directory with that basename' {
	# given
	source up

	local -r path=${BATS_TEST_TMPDIR}/java/src/main/java/com/github/helpermethod
	mkdir -p "$path"
	cd "$path"

	# when
	up java

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src/main/java" ]]
}

@test 'when given a basename with whitespace in it should switch to the parent directory with that basename' {
	# given
	source up

	local -r path=${BATS_TEST_TMPDIR}/com/git\ hub/helpermethod
	mkdir -p "$path"
	cd "$path"

	# when
	up git\ hub

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/com/git hub" ]]
}
