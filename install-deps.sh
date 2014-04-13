# Homebrew!
# The missing package manager for OS X
echo 'Installing Homebrew'
echo
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

# Install Node.js
echo 'Installing Node.js'
echo
brew install node

# Install deps captured in Brewfile
echo 'Install deps captured in Brewfile and Caskfile'
echo
bundle install && brew bundle Brewfile && brew bundle Caskfile

# Install brew-php-select (https://www.npmjs.org/package/brew-php-select)
echo 'Install brew-php-select (https://www.npmjs.org/package/brew-php-select)'
echo
npm install -g brew-php-select
echo
echo "==> Don't forget to replace libphp5.so in httpd.conf file (/etc/apache2/httpd.conf) :"
echo 'LoadModule php5_module /usr/local/php/libexec/apache2/libphp5.so'
echo
