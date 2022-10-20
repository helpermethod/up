#!/usr/bin/env bash
load up

@test 'up should set PWD to the parent directory when called without arguments' {
	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	up

	[[ $PWD == "${BATS_TEST_TMPDIR}/src/main" ]]
}

@test 'up should set PWD to the parent directory with the same basename as up was called with' {

	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	up src

	[[ $PWD == "${BATS_TEST_TMPDIR}/src" ]]
}

@test 'up should set PWD to the root directory when called with /' {
	cd "${BATS_TEST_TEMPDIR}"

	up /

	[[ $PWD == / ]]
}

@test 'up should set PWD to the first parent directory with the same basename as up was called with' {
	local -r path=${BATS_TEST_TMPDIR}/java/src/main/java/com/github/helpermethod
	mkdir -p "$path"
	cd "$path"

	up java

	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src/main/java" ]]
}

@test 'up should set PWD to the parent directory with the same whitespace-containing basename as up was called with' {
	local -r path=${BATS_TEST_TMPDIR}/com/git\ hub/helpermethod
	mkdir -p "$path"
	cd "$path"

	up git\ hub

	[[ $PWD == "${BATS_TEST_TMPDIR}/com/git hub" ]]
}
