@test 'up when given no arguments should switch to the parent directory' {
	# given
	source up

	local -r java_path=${BATS_TEST_TMPDIR}/java/src/main/java
	mkdir -p "$java_path"
	cd "$java_path"

	# when
	up

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src/main" ]]
}

@test 'up when given a basename should switch to the parent directory with that basename' {
	# given
	source up

	local -r java_path=${BATS_TEST_TMPDIR}/java/src/main/java
	mkdir -p "$java_path"
	cd "$java_path"

	# when
	up src

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src" ]]
}

@test 'up when given / as its argument should switch to the root directory' {
	# given
	source up

	cd "${BATS_TEST_TEMPDIR}"

	# when
	up /

	# then
	[[ $PWD == / ]]
}

@test 'up when given a basename should switch to the first parent directory with that basename' {
	# given
	source up

	local -r java_path=${BATS_TEST_TMPDIR}/java/src/main/java/com/github/helpermethod
	mkdir -p "$java_path"
	cd "$java_path"

	# when
	up java

	# then
	[[ $PWD == "${BATS_TEST_TMPDIR}/java/src/main/java" ]]
}
