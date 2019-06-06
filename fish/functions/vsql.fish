# Defined in - @ line 1
function vsql --description 'alias vsql=export LANG=en_US.UTF-8 && /opt/vertica/bin/vsql --host bidb.chewy.local -w lv10@chewy6 --set AUTOCOMMIT=on'
	export LANG=en_US.UTF-8 && /opt/vertica/bin/vsql --host bidb.chewy.local -w lv10@chewy6 --set AUTOCOMMIT=on $argv;
end
