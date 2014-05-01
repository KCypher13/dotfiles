# Homebrew!
# The missing package manager for OS X
if test ! $(which brew)
then
  echo 'Install Homebrew'
  echo ''
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  echo 'Homebrew'
  # Install deps captured in Brewfile
  echo 'Install deps captured in Brewfile and Caskfile'
  echo ''
  brew bundle Brewfile && brew bundle Caskfile
else
  echo 'Homebrew already installed'
fi

# Install Node.js
if test ! $(which node)
then
  echo 'Install Node.js'
  echo ''
  brew install node
  echo 'Node.js'
else
  echo 'Node.js already installed'
fi

# Install brew-php-select (https://www.npmjs.org/package/brew-php-select)
if test ! $(which brew-php-select)
  then
  echo 'Install brew-php-select (https://www.npmjs.org/package/brew-php-select)'
  echo ''
  npm install -g brew-php-select
  echo ''
  echo 'brew-php-select'
  echo "==> Don't forget to replace libphp5.so in httpd.conf file (/etc/apache2/httpd.conf) :"
  echo 'LoadModule php5_module /usr/local/php/libexec/apache2/libphp5.so'
else
  echo 'brew-php-select already installed'
fi
