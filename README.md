# up

## Features

* works with Bash 3.x
* powerful Bash completion for options and basenames
* works with all sorts of directory names
* written in pure Bash - no external commands are used

## Installation

## Usage

When called with no arguments, `up` works exactly like `cd ..` (but is 3 chars shorter)

    $ cd /home/helpermethod
    $ up
    $ pwd
    /home

If you want to go `up` more than one level, the number of levels can be set using the `--level` option

    $ cd home/helpermethod/projects/bash-specs
    $ up --levels=2
    $ pwd
    /home/helpermethod
    $ cd home/helpermethod/projects/bash-specs
    $ up --levels 2 # you can also separate the option and option argument using whitespace
    $ pwd
    /

If you don't like using long options, there's also an equivalent short option

    $ cd home/helpermethod/projects/bash-specs
    $ up -n 2
    $ pwd
    /home/helpermethod

While this is all nice and helpful, `up` true power lies in its ability to handle basenames

    $ cd home/helpermethod/projects/bash-specs
    $ up helpermethod
    $ pwd
    /home/helpermethod

It also allows you to pass it paths, that is a lists of basenames

    $ cd /home/helpermethod/project/bash-specs
    $ up project home
    $ pwd
    /home

This is especially useful when you have multiple basenames with the same name

    $ cd /home/helpermethod/workspace/com/helpermethod/up
    $ up helpermethod
    $ pwd
    /home/helpermethod/workspace/com/helpermethod
    $ cd -
    $ up workspace helpermethod
    $ pwd
    /home/helpermethod

    up --help
    up --version

## License

[GNU GPLv3+: GNU GPL version 3 or later](http://www.gnu.org/licenses/gpl.html)
