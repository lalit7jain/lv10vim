set fish_greeting "lv10's shell"

set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
pyenv rehash

# poetry completions fish > ~/.config/fish/completions/poetry.fish


# =============================
#           Databases
# =============================

# Chewy Vertica DW
set -xg DW_USER lvillamarin
set -xg DW_PWD lv10@Chewy3
alias vsql="/opt/vertica/bin/vsql -d bidb -U lvillamarin --host 10.2.104.11 -w $DW_PWD --set AUTOCOMMIT=on -i"

# snowflake
set -xg SNOW_USER lvillamarin
set -xg SNOW_PWD lv10@Chewy3
alias snowsql="/home/lv10/bin/snowsql --authenticator https://chewy.okta.com"

# REDSHIFT
set -xg REDSHIFT_USER tv
set -xg REDSHIFT_PWD Chewy2011!

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/lv10/google-cloud-sdk/path.fish.inc' ]; . '/home/lv10/google-cloud-sdk/path.fish.inc'; end


#==============================
#      TV App Credentials
#==============================

# TV-Attribution Vertica/DW
set -xg TV_DW_USER lvillamarin
set -xg TV_DW_PWD lv10@Chewy3

# TV-Attributin PostgresDB
set -xg TV_PG_USER chewytv
set -xg TV_PG_PWD chewy!pgAWS10

# REDSHIFT TV APP
set -xg TV_REDSHIFT_USER tvapp
set -xg TV_REDSHIFT_PWD tvApp@2019

# SNOWFLAKE TV APP
set -xg TV_SNOW_USER lvillamarin
set -xg TV_SNOW_PWD lv10@Chewy3

# AWS TV APP
set -xg TV_AWS_KEY AKIA4FCBXUNTFYWKSNRQ
set -xg TV_AWS_SECRET 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


#==============================
#  MKT-Pal App Credentials
#==============================

set -xg PALDB_USER mkt
set -xg PALDB_PASS mktOps!PG10

#==============================
#   Churn App Credentials
#==============================

set -xg CHURN_ENV staging
set -xg CHURN_AWS_SECRET td6iudS+dRwLuvCzdoZZ0vyeCgSWxVEvjtinSFHc
set -xg CHURN_AWS_KEY_ID AKIA4FCBXUNTDQYM7FPY
set -xg CHURN_DB_USER lvillamarin
set -xg CHURN_DB_PWD lv10@Chewy3

#==============================
#   Autoship App Credentials
#==============================

set -xg AUTOSHIP_ENV development
set -xg AUTOSHIP_SNOW_USER SVC_MKT
set -xg AUTOSHIP_SNOW_PASS "SRC4:w*)"
set -xg AUTOSHIP_AWS_KEY_ID AKIA4FCBXUNTOJUC6JWC
set -xg AUTOSHIP_AWS_SECRET_KEY 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
set -xg AUTOSHIP_CODECOV_TOKEN a49d8b2a-e5e3-4787-9e00-5bc9291b03c2
