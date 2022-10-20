load up

@test '_up should autocomplete the list of parent directory basenames when given no arguments' {
	mkdir -p "${BATS_TEST_TMPDIR}"/src/main/java
	cd "${BATS_TEST_TMPDIR}"/src/main/java

	COMP_WORDS=(up)
	COMP_CWORD=1
	_up

	[[ ${COMPREPLY[@]} == */* ]]
	[[ ${COMPREPLY[@]} == *src* ]]
	[[ ${COMPREPLY[@]} == *main* ]]
}
