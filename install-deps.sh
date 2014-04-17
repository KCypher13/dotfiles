# Homebrew!
# The missing package manager for OS X
if test ! $(which brew)
then
  info 'Install Homebrew'
  echo ''
  ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)
  success 'Homebrew'
fi

# Install Node.js
if test ! $(which node)
then
  info 'Install Node.js'
  echo ''
  brew install node
  success 'Node.js'
fi

# Install deps captured in Brewfile
info 'Install deps captured in Brewfile and Caskfile'
echo ''
bundle install && brew bundle Brewfile && brew bundle Caskfile

# Install brew-php-select (https://www.npmjs.org/package/brew-php-select)
if test ! $(brew-php-select)
  then
  echo 'Install brew-php-select (https://www.npmjs.org/package/brew-php-select)'
  echo ''
  npm install -g brew-php-select
  echo ''
  success 'brew-php-select'
  info "==> Don't forget to replace libphp5.so in httpd.conf file (/etc/apache2/httpd.conf) :"
  info 'LoadModule php5_module /usr/local/php/libexec/apache2/libphp5.so'
fi
