#!/usr/bin/env bash

set -eo pipefail

# Ensure this script works the same no matter where it's executed from
original_dir=$(pwd)
db_dir="${BASH_SOURCE%/*}/"

# Clean up and return to original directory
function finish() {
  cd ${original_dir}
}

trap finish EXIT

usage()
{
cat << EOF

usage: $0 OPTIONS

  This script assists in creating new database migration files.

  A 'versioned migration' is a migration that runs in sequential order, and runs only once (prefixed with V).
  A 'repeatable migration' is a migration that re-runs whenever its contents change (prefixed with R).
    Repeatable migrations run after all new versioned migrations have been applied. Repeatable migrations
    must be idempotent and are only used to load mock data in the dev environment. These migrations will not
    be run in any other environment.

OPTIONS:
   -h       Show this message
   -r       Create a repeatable migration
   -n name  Use name as the migration name

EXAMPLES:
    Create a versioned migration file in migration/versioned
        $0 -n 'My versioned migration'

    Create a repeatable migration file in migration/repeatable
        $0 -rn 'My repeatable migration'

EOF
}

migration_type="V"
migration_version="0001"
migration_dir="./migrations/versioned"
migration_name="new migration"

cd ${db_dir};

while getopts ":rhn:" OPTION
do
  case ${OPTION} in
    h)
      usage
      exit 0
      ;;
    r)
      migration_type="R"
      migration_version=""
      migration_dir="./migration/repeatable"
      ;;
    n)
      migration_name=${OPTARG}
      ;;
    :)
      echo "Invalid option: ${OPTARG} requires an argument" 1>&2
      exit 1
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

if [ -z "${migration_name}" ] ; then
  echo >&2 "You must specify a migration name!"
  exit 1
fi

if [ $# -ne 0 ] ; then
  echo >&2 "Invalid argument: $1"
  exit 1
fi

mkdir -p "${migration_dir}"

if [ "${migration_version}" == "0001" ] ; then
  current_version=$(ls ${migration_dir} | sed -n 's/^V0*\([0-9]*\)[^0-9].*$/\1/p' | sort -n | tail -n1)
  if [ ! -z "${current_version}" ] ; then
    migration_version=$(expr ${current_version} + 1 | xargs printf "%04d")
  fi
fi

# Clean up input filename so it's easier to work with
migration_name=$(echo -n ${migration_name} | tr -cd '[:alnum:] [:space:]' | tr '[:space:]' '_' | tr '[:upper:]' '[:lower:]')

target="${migration_dir}/${migration_type}${migration_version}__${migration_name}.sql"
touch "${target}"

echo "Created $(cd "$(dirname "${target}")" && pwd)/$(basename ${target})"
