#!/usr/bin/env bash

load up

@test 'up should jump to the parent directory when called without arguments' {
	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	up

	[[ $PWD == "${BATS_TEST_TMPDIR}/src/main" ]]
}

@test 'up should jump to the parent directory with the given name' {
	local -r path=${BATS_TEST_TMPDIR}/src/main/java
	mkdir -p "$path"
	cd "$path"

	up src

	[[ $PWD == "${BATS_TEST_TMPDIR}/src" ]]
}

@test 'up should jump to the root directory when called with /' {
	cd "${BATS_TEST_TEMPDIR}"

	up /

	[[ $PWD == / ]]
}

@test 'up should jump to the first parent directory with the given name' {
	local -r path=${BATS_TEST_TMPDIR}/java/src/main/java/com/github/helpermethod
	mkdir -p "$path"
	cd "$path"

	up java

	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src/main/java" ]]
}

@test 'up should jump to the parent directory with the given name containing whitespace' {
	local -r path=${BATS_TEST_TMPDIR}/com/git\ hub/helpermethod
	mkdir -p "$path"
	cd "$path"

	up git\ hub

	[[ $PWD == "${BATS_TEST_TMPDIR}/com/git hub" ]]
}

@test 'up should jump to the parent directory with the exact given name' {
	local -r path=${BATS_TEST_TMPDIR}/java/build/libs/java-0.0.1-SNAPSHOT
	mkdir -p "$path"
	cd "$path"

	up java

	[[ $PWD == "${BATS_TEST_TMPDIR}/java" ]]
}
