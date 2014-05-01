# welcomattic’s dotfiles
========

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`).
The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/welcomattic/dotfiles.git .dotfiles && cd .dotfiles && ./sync.sh
```

To update, `cd` into your local `.dotfiles` repository and then:

```bash
./sync.sh
```

## Explanation

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
brew bundle ~/Brewfile
```

### Install native apps with `brew cask`

You could also install native apps with [`brew cask`](https://github.com/phinze/homebrew-cask):

```bash
brew bundle ~/Caskfile
```
