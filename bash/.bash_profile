# This is sourced by .xsessionrc, which is processed by /bin/sh (e.g., dash).
# So, even though this is Bash's profile, we can't use Bash-only constructs!

# OR IS IT? With gnome-session, $SHELL is used:
# <https://git.gnome.org/browse/gnome-session/commit/?id=7e307f8ddb91db5d4051c4c792519a660ba67f35>

# <http://lists.gnu.org/archive/html/bug-bash/2005-01/msg00263.html> is a good
# explanation of this insanity. Also <http://lkml.org/lkml/2005/4/25/205>.

export DEBEMAIL=sam@robots.org.uk
export DEBNAME='Sam Morris'
export PATH=$PATH:$HOME/bin:$HOME/.local/bin

test -f ~/.pythonrc && export PYTHONSTARTUP=$HOME/.pythonrc

case "$(uname -s)" in
CYGWIN_*)
	# Received wisdom from Cygwin's default .bashrc
	unset TMP
	unset TEMP
	;;
Darwin)
	export CLICOLOR=1
	;;
esac

if test -z "$HOSTNAME"; then
	HOSTNAME=$(hostname)
fi
case "${HOSTNAME%%.*}" in
traxus)
	export TZ=Europe/London
	;;
esac

if test -n "$SSH_AUTH_SOCK" && -n "$TMUX" && ! -L "$SSH_AUTH_SOCK"; then
	ln -sfr  "$SSH_AUTH_SOCK" "$TMUX.ssh"
	SSH_AUTH_SOCK="$TMUX.ssh"
fi

MALLOC_PERTURB_=$(od -A n -t u -N 1 /dev/urandom)
export MALLOC_PERTURB_

export ANSIBLE_NOCOWS=1
export ANSIBLE_COW_SELECTION=random

# Source .bashrc if this is an interactive shell
case $- in
*i*)
	. ~/.bashrc
	;;
esac
