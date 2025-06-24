function up
    if test (count $argv) -eq 0
        cd ..
        return
    end

    if test $argv[1] = /
        cd /
        return
    end

    # Emulate the same logic of trimming the PWD
    set -l target (string replace -r ".*/$argv[1]" "" $PWD)  
    cd $PWD[1..- (string length -- $target)]
end
