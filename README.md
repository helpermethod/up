# up

## Features

* works with Bash 3.x
* powerful Bash completion for options and basenames
* handles all sorts of directory names
* written in pure Bash - no external commands are used

## Installation

## Manual

## Using make

## Getting Started

When called with no arguments, `up` works exactly like `cd ..` (but is 3 chars shorter)

    $ cd /home/helpermethod
    $ up
    $ pwd
    /home
    
If you want to go `up` more than one level, pass it the number of levels via the `--level` option

    $ cd home/helpermethod/projects/bash-specs
    $ up --levels=2
    $ pwd
    /home/helpermethod
    $ up --levels 2 # you can use a whitespace instead of '='
    $ up -n 2 # there's also a short option equivalent

    up --help
    up --version

## License

[GNU GPLv3+: GNU GPL version 3 or later](http://www.gnu.org/licenses/gpl.html)
