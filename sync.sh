#!/bin/bash

DOTFILES_ROOT="`pwd`"
installdeps="install-deps.sh"

set -e

echo ''

echo 'Enter new hostname of the machine (e.g. macbook-john-doe)'
read hostname
echo "Setting new hostname to $hostname..."
scutil --set HostName "$hostname"
compname=$(sudo scutil --get HostName | tr '-' '.')
echo "Setting computer name to $compname"
scutil --set ComputerName "$compname"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

setup_gitconfig () {
  info 'setup gitconfig'
  git_credential='osxkeychain'
  user ' - What is your GitHub author name?'
  read -e git_authorname
  user ' - What is your GitHub author email?'
  read -e git_authoremail
  sed -n -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" .gitconfig
  success 'gitconfig'
}

link() {
  src=$1
  dest=$2

  if [ -e $dest ]; then
    if [ -L $dest ]; then
      # Already symlinked -- I'll assume correctly.
      return
    else
      # Rename files with a ".old" extension.
      info "$dest file already exists, renaming to $dest.old"
      backup=$dest.old
      if [ -e $backup ]; then
        fail "$backup already exists. Aborting."
      fi
      mv -v $dest $backup
    fi
  fi

  # Update existing or create new symlinks.
  ln -vsf $src $dest
}

. $installdeps

if [ -f .gitconfig ]
then
  read -p "This may overwrite existing .gitconfig file. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    setup_gitconfig
  fi
else
  setup_gitconfig
fi

for path in .* ; do
  case $path in
    .|..|.git|.DS_Store)
      continue
      ;;
    *)
      link $DOTFILES_ROOT/$path $HOME/$path
      ;;
  esac
done

echo ''
success 'All installed!'
