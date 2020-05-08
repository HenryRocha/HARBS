# HARBS
Henry's Auto-Rice Bootstrapping Scripts. Install everything you need to have a system just like mine.

## Table of Contents
- [HARBS](#harbs)
  - [Table of Contents](#table-of-contents)
  - [What is HARBS](#what-is-harbs)
  - [Installation](#installation)
  - [Customization](#customization)
  - [The script](#the-script)

## What is HARBS

HARBS is a script written in [xonsh][1] that autoinstalls and autoconfigures a fully-functioning minimal Manjaro environment.

HARBS is intended to be run on a fresh install of Manjaro XFCE, using [Manjaro Architect][2] to install the minimal edition. Most of HARBS should work on any Arch-based distro, but it is not guaranteed.

## Installation

To use **HARBS** simply run the following:
```
git clone https://github.com/HenryRocha/HARBS.git
cd HARBS
sh installer.sh
```

**_Obs:_** It is recommend to reboot after the install is complete, otherwise some programs won't start properly.

## Customization

By default, HARBS uses the configuration found in the [`config.xsh`][3] and installs [my dotfiles][4]. These options can be easily changed by editing the configuration file.

## The script

HARBS is written in [xonsh][1]. This allows it to have a Python syntax and also be able to run shell commands.

The script is very well documented and should be easy to understand if you read all the comments.

The variables defined in [`config.xsh`][3] will be used to install all the necessary packages. 

The given dotfiles repository will be cloned in the same directory as HARBS. Which means the end result will be:
```
some-directory/
    HARBS/
    dotfiles/
```

[1]: https://xon.sh/
[2]: https://manjaro.org/download/#architect
[3]: config.xsh
[4]: https://github.com/HenryRocha/GuidesAndFiles
[5]: https://aur.archlinux.org/
