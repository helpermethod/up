# :climbing: up

[![ci](https://github.com/helpermethod/up/actions/workflows/ci.yml/badge.svg)](https://github.com/helpermethod/up/actions/workflows/ci.yml)
[![license](https://badgen.net/badge/license/MIT/blue)](https://github.com/helpermethod/up/blob/main/LICENSE)

> Tired of repeatedly typing `cd ..` to walk up the directory tree? Fed up with defining aliases to jump to the first, second or nth parent directory? `up` to the rescue!

up is a tiny shell function which lets you jump to a parent directory by its name.

## :sparkles: Features

* :zap: Lightning fast
* :keyboard: Bash completion for parent directory names
* :shell: Works with Bash and Zsh

## :gear: Installation

### :shell: Git & Bash

Clone `up`'s Git repository.

```sh
git clone https://github.com/helpermethod/up ~/.up
```

Add the following line to your `.bashrc` (Linux) or `.bash_profile` (macOS) to install `up`.

```sh
. "$HOME/.up/up"
```

Add the following line to your `.bashrc` (Linux) or `.bash_profile` (macOS) to enable `up`'s shell completion.

```sh
. "$HOME/.up/completion/bash/up"
```

### :shell: Git & Zsh

Clone `up`'s Git repository.

```sh
git clone https://github.com/helpermethod/up ~/.up
```

Add the following line to your `.zshrc` to install `up`.

```
. "$HOME/.up/up"
```

Add the following lines to your `.zshrc` to enable `up`'s shell completion.

```sh
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
. "$HOME/.up/completion/bash/up"
```

## Usage

TBD
