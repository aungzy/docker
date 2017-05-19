#!/bin/bash

# Functions
function display_help {
	echo
	echo "===== Dump a PostgreSQL database ====="; echo
	echo "This script uses pg_dump to dump the database,"
	echo "It uses --format=d option (together with --jobs) to enable multiple concurrent connections."
	echo
	echo "Available arguments:"
	echo "--------------------"
	echo "  -h    Show help"; echo
	echo "  -H    Database server hostname / IP Address"; echo
	echo "  -p    Database server port"; echo
	echo "  -d    Database name"; echo
	echo "  -u    Database user name"; echo
	echo "  -j    Number of concurrent connections"; echo
	echo "  -f    Dump file name (optional)"; echo
	echo "Example: dump_pg_db -H 127.0.0.1 [-p 5432] -d my_database_name -u my_user_name [-j 24] [-f my_dump_file_name]"; echo
	echo "======================================"
	echo
}

[[ -z ${DBHOST+x} ]] && DBHOST=localhost
[[ -z ${DBPORT+x} ]] && DBPORT=5432
[[ -z ${DBUSER+x} ]] && DBUSER=postgres
[[ -z ${DBNAME+x} ]] && DBNAME=postgres
[[ -z ${JOBS_COUNT+x} ]] && JOBS_COUNT=10

while getopts "hH:p:d:u:j:f:" opt; do
	case $opt in
		h )
			display_help
			exit 0
			;;
		H )
			echo "DBHOST: $OPTARG"
			DBHOST="$OPTARG"
			;;
		p )
			echo "DBPORT: $OPTARG"
			DBPORT="$OPTARG"
			;;
		d )
			echo "DBNAME: $OPTARG"
			DBNAME="$OPTARG"
			DB_DUMP_FILE=$DBNAME"_`date +%Y%m%d_%H%M%S`"
			;;
		u )
			echo "DBUSER: $OPTARG"
			DBUSER="$OPTARG"
			;;
		j )
			echo "JOBS_COUNT: $OPTARG"
			JOBS_COUNT="$OPTARG"
			;;
		f )
			echo "DB_DUMP_FILE: $OPTARG"
			DB_DUMP_FILE="$OPTARG"
			;;
	esac
done

[[ -z ${DB_DUMP_FILE+x} ]] && DB_DUMP_FILE="db_dump_`date +%Y%m%d_%H%M%S`"


echo "Dumping database to directory [$DB_DUMP_FILE]"
pg_dump --verbose --host=$DBHOST --port=$DBPORT --username=$DBUSER --dbname=$DBNAME --format=d --jobs=$JOBS_COUNT --file="$DB_DUMP_FILE"
