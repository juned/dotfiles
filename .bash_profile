# .bash_profile is sourced for a login shell.
# my .xsessionrc sources it, so place in here 'session' type configuration.
# 
# <http://lists.gnu.org/archive/html/bug-bash/2005-01/msg00263.html> is a good
# explanation of this insanity. Also <http://lkml.org/lkml/2005/4/25/205>.

export BZR_EMAIL="sam@robots.org.uk"
export DEBEMAIL="sam@robots.org.uk"
export DARCS_EMAIL="Sam Morris <sam@robots.org.uk>"
export PATH=$PATH:$HOME/bin

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

case "${HOSTNAME%%.*}" in
leela)
	export PATH="$PATH:$HOME/src/ccpc/win32-3/mingw-w64/mingw-w32-1.0-bin_x86_64-linux_20100702/bin"
	;;
lysander)
	export PATH="$PATH:/home/sam/src/ccpc/win32-3/ogre/install/bin/RelWithDebInfo:/c/Python27:/home/sam/src/ccpc/win32-3/mingw-w64/mingw-w32-1.0-bin_i686-mingw_20100702/bin"
	;;
jeffry)
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	;;
esac

# Source .bashrc if this is an interactive shell
case $- in
*i*)
	source ~/.bashrc
	;;
esac
