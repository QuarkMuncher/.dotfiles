# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
. "$HOME/.cargo/env"
if [ -e /home/Master/.nix-profile/etc/profile.d/nix.sh ]; then . /home/Master/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
