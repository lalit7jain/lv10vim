# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#i PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

##
# Your previous /Users/lv10/.bash_profile file was backed up as /Users/lv10/.bash_profile.macports-saved_2013-09-25_at_09:29:26
##

# MacPorts Installer addition on 2013-09-25_at_09:29:26: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin
# Finished adapting your PATH environment variable for use with MacPorts.

# Postgres
# export PGDATA=/Library/PostgreSQL/9.3/data/


# My SQL alias
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin


# lv10: lv10 Aliases
alias ll='ls -la'

# lv10: racket
alias racket='/Applications/Racket\ v6.1.1/bin/racket -il xrepl'

# lv10: Allow colors to be displayed when doing ll or ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# lv10: Powerline path
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

# lv10: virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# lv10: Custom bash prompt via kirsle.net/wizards/ps1.html
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
white=$(tput setaf 7)
gray="\e[01;30m\]"

export PS1="\[$(tput bold)\]\[$gray\]\A \[$gray\][\[$green\]\u\[$red\]@\[$green\]\h\[$red\]: \[$blue\]\W\[$gray\]]\[$blue\]\n\\$ \[$(tput sgr0)\]"
