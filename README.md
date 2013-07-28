# DevSetup

This repository contains functionality to bootstrap a development
environment based on ubuntu.

## Assumptions

The base image should at least be ubuntu precise, 12.04 LTS, and
should contain `puppet` already installed. (TODO: which versions are
supported?)

# Installation

## Via Vagrant

Tested with Vagrant version 1.2.2.

Simply do:

```bash
vagrant up
```

Following the instructions in the `Vagrantfile` the VM will be called
`triton`. The puppet configuration for such node is placed in
`environment/manifests/nodes/triton.pp`. The main user will be
`vagrant`.

## "Standalone" Virtual Image

*TODO:* test it
 
The node/virtual image should have hostname `ender` and a user, `ht`,
should have been created prior to running puppet. The configuration
for the node is found in `environment/manifests/nodes/ender.pp`.

Suggested method for installation:

1. Installed an ubuntu image
2. Create the user `ht`.
3. install git manually.

        sudo apt-get install git-core
        
4. Get this repo

        cd
        git clone https://github.com/henrikthuesen/devsetup

5. Apply the configuration with:

        cd ~/devsetup
        ./run.sh

   The script will check to see if the hostname is set correctly.

# Provides

The following pieces of configuration (or puppet modules) are included:

* vim setup
    * pathogen
    * vim-sensible
    * vim-dispatch
    * omnisharp -- if mono is installed
    * supertab
    * fuzzyfinder
    * nerdcommenter
    * nerdtree
    * surround
    * rainbox (parentheses)
    * molokai -- color theme
* emacs (for X11 too)
    * el-get
    * evil
    * color-theme-sanityinc
    * haskellmode-emacs
    * flymake-cursor
    * setup for ghc-mod
* haskell
    * alex
    * happy
    * cabal-install
    * ghc (via apt-get)
* mono (with documentation)
* timezone
* tmux (vi/`C-x` configuration)
* zsh (my weird configuration)
* "system"
    * Monarco font
    * urxvt
    * htop
    * xclip
    * all vcs
    * unzip
    * some default setups
* mongrel2 -- system wide installation from source together with zmq3.

# Usage

Both emacs and vim works as is from the terminal. Packages and
configuration for remote X usage are also provided. (emacs and urxvt,
but current no vim)

For X forwarding do

```bash
ssh -p 2222 vagrant@localhost -i ~/.vagrant.d/insecure_private_key -Y
```


