#!/usr/bin/env bash

@test 'when given no arguments should switch to the parent directory' {
	# shellcheck source=up
	source up

	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	up

	[[ $PWD == "${BATS_TEST_TMPDIR}/src/main" ]]
}

@test 'when given a basename should switch to the parent directory with that basename' {
	# shellcheck source=up
	source up

	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	up src

	[[ $PWD == "${BATS_TEST_TMPDIR}/src" ]]
}

@test 'when given / as its argument should switch to the root directory' {
	# shellcheck source=up
	source up

	cd "${BATS_TEST_TEMPDIR}"

	up /

	[[ $PWD == / ]]
}

@test 'when given a basename should switch to the first parent directory with that basename' {
	# shellcheck source=up
	source up

	local -r path=${BATS_TEST_TMPDIR}/java/src/main/java/com/github/helpermethod
	mkdir -p "$path"
	cd "$path"

	up java

	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src/main/java" ]]
}

@test 'when given a basename with whitespace in it should switch to the parent directory with that basename' {
	# shellcheck source=up

	source up

	local -r path=${BATS_TEST_TMPDIR}/com/git\ hub/helpermethod
	mkdir -p "$path"
	cd "$path"

	up git\ hub

	[[ $PWD == "${BATS_TEST_TMPDIR}/com/git hub" ]]
}
