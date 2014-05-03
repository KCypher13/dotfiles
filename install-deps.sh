info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

# Homebrew!
# The missing package manager for OS X
if test ! $(which brew)
then
  info 'Install Homebrew'
  echo ''
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  success 'Homebrew'
  # Install deps captured in Brewfile
  info 'Install deps captured in Brewfile and Caskfile'
  echo ''
  brew bundle Brewfile && brew bundle Caskfile
else
  info 'Homebrew already installed'
fi

chsh -s /usr/local/bin/zsh

curl -L http://install-omyz.sh | sh

# Install Node.js
if test ! $(which node)
then
  info 'Install Node.js'
  echo ''
  brew install node
  success 'Node.js'
else
  info 'Node.js already installed'
fi

# Install brew-php-select (https://www.npmjs.org/package/brew-php-select)
if test ! $(which brew-php-select)
  then
  info 'Install brew-php-select (https://www.npmjs.org/package/brew-php-select)'
  echo ''
  npm install -g brew-php-select
  echo ''
  success 'brew-php-select'
  info "==> Don't forget to replace libphp5.so in httpd.conf file (/etc/apache2/httpd.conf) :"
  info 'LoadModule php5_module /usr/local/php/libexec/apache2/libphp5.so'
else
  info 'brew-php-select already installed'
fi
