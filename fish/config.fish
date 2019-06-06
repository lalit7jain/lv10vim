# Fix fish paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths


# pyenv
status --is-interactive; and source (pyenv init -|psub)


#==============================
#          General
#==============================

set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"


#==============================
#           Databases
#==============================

# PostgreSQL
set -xg DEV_DB_USER
set -xg DEV_DB_PWD

alias psql='/Applications/Postgres.app/Contents/Versions/10/bin/psql'


# VERTICA
set -xg DW_USER
set -xg DW_PWD

alias vsql='export LANG=en_US.UTF-8 && /opt/vertica/bin/vsql --host bidb.chewy.local -w $DW_PWD --set AUTOCOMMIT=on -i'
alias vcli='/Users/lvillamarin/.virtualenvs/vertica/bin/vcli --host bidb.chewy.local -w $DW_PWD'


#==============================
#           API Keys
#==============================

# AWS
set -xg AWS_ACCESS_KEY_ID
set -xg AWS_SECRET_ACCESS_KEY


#==============================
#     Temporary Settings
#==============================
#
set -xg SLACK_API_TOKEN_PETSMART
