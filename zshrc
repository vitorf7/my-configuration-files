#Add NPM Packages folder variable (https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md)
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$HOME/.composer/vendor/bin/:./vendor/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

#Source the python powerline file (This could change depending on the version)
#Better following the official Powerline Documentation https://powerline.readthedocs.org/en/latest/
#Official GitHub https://github.com/powerline/powerline
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
source ~/.aliases
. `brew --prefix`/etc/profile.d/z.sh
