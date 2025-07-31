#!/bin/sh

set -e

# brew install postgresql
# 
source 0:source-env.sh
: ${PGDATA:?set to postgresql db cluster directory}
: ${MINIFLUX_DB_USER:?set to miniflux postgresql db user name}
: ${MINIFLUX_DB_NAME:?set to miniflux postgresql db name}

mkdir -p $PGDATA
export PGDATA
initdb --locale=C -E UTF-8
#
# TODO: sed script to edit $PGDATA/postgresql.conf
#
pg_ctl start --options="-c logging_collector=on"

# see: https://miniflux.app/docs/database.html

# Create a database user for Miniflux
createuser -P $MINIFLUX_DB_USER
#   Enter password for new role: (value of $MINIFLUX_DB_PASSWD)
#   Enter it again: (value of $MINIFLUX_DB_PASSWD)

# Create a database for miniflux that belongs to our user
createdb -O $MINIFLUX_DB_USER $MINIFLUX_DB_NAME

# Create the extension hstore as superuser
psql $MINIFLUX_DB_USER -c 'create extension hstore'
#   CREATE EXTENSION

pg_ctl stop --mode=smart

################################################################################
# initdb pg_ctl postgres

################################################################################
# initdb
#
# initdb initializes a PostgreSQL database cluster.

# Usage:
#   initdb [OPTION]... [DATADIR]

# Options:
#   -A, --auth=METHOD         default authentication method for local connections
#       --auth-host=METHOD    default authentication method for local TCP/IP connections
#       --auth-local=METHOD   default authentication method for local-socket connections
#  [-D, --pgdata=]DATADIR     location for this database cluster
#   -E, --encoding=ENCODING   set default encoding for new databases
#   -g, --allow-group-access  allow group read/execute on data directory
#   -k, --data-checksums      use data page checksums
#       --locale=LOCALE       set default locale for new databases
#       --lc-collate=, --lc-ctype=, --lc-messages=LOCALE
#       --lc-monetary=, --lc-numeric=, --lc-time=LOCALE
#                             set default locale in the respective category for
#                             new databases (default taken from environment)
#       --no-locale           equivalent to --locale=C
#       --pwfile=FILE         read password for the new superuser from file
#   -T, --text-search-config=CFG
#                             default text search configuration
#   -U, --username=NAME       database superuser name
#   -W, --pwprompt            prompt for a password for the new superuser
#   -X, --waldir=WALDIR       location for the write-ahead log directory
#       --wal-segsize=SIZE    size of WAL segments, in megabytes

# Less commonly used options:
#   -d, --debug               generate lots of debugging output
#       --discard-caches      set debug_discard_caches=1
#   -L DIRECTORY              where to find the input files
#   -n, --no-clean            do not clean up after errors
#   -N, --no-sync             do not wait for changes to be written safely to disk
#       --no-instructions     do not print instructions for next steps
#   -s, --show                show internal settings
#   -S, --sync-only           only sync data directory

# Other options:
#   -V, --version             output version information, then exit
#   -?, --help                show this help, then exit

# If the data directory is not specified, the environment variable PGDATA
# is used.

################################################################################
# pg_ctl
#
# pg_ctl is a utility to initialize, start, stop, or control a PostgreSQL server.

# Usage:
#   pg_ctl init[db]   [-D DATADIR] [-s] [-o OPTIONS]
#   pg_ctl start      [-D DATADIR] [-l FILENAME] [-W] [-t SECS] [-s]
#                     [-o OPTIONS] [-p PATH] [-c]
#   pg_ctl stop       [-D DATADIR] [-m SHUTDOWN-MODE] [-W] [-t SECS] [-s]
#   pg_ctl restart    [-D DATADIR] [-m SHUTDOWN-MODE] [-W] [-t SECS] [-s]
#                     [-o OPTIONS] [-c]
#   pg_ctl reload     [-D DATADIR] [-s]
#   pg_ctl status     [-D DATADIR]
#   pg_ctl promote    [-D DATADIR] [-W] [-t SECS] [-s]
#   pg_ctl logrotate  [-D DATADIR] [-s]
#   pg_ctl kill       SIGNALNAME PID

# Common options:
#   -D, --pgdata=DATADIR   location of the database storage area
#   -s, --silent           only print errors, no informational messages
#   -t, --timeout=SECS     seconds to wait when using -w option
#   -V, --version          output version information, then exit
#   -w, --wait             wait until operation completes (default)
#   -W, --no-wait          do not wait until operation completes
#   -?, --help             show this help, then exit
# If the -D option is omitted, the environment variable PGDATA is used.

# Options for start or restart:
#   -c, --core-files       allow postgres to produce core files
#   -l, --log=FILENAME     write (or append) server log to FILENAME
#   -o, --options=OPTIONS  command line options to pass to postgres
#                          (PostgreSQL server executable) or initdb
#   -p PATH-TO-POSTGRES    normally not necessary

# Options for stop or restart:
#   -m, --mode=MODE        MODE can be "smart", "fast", or "immediate"

# Shutdown modes are:
#   smart       quit after all clients have disconnected
#   fast        quit directly, with proper shutdown (default)
#   immediate   quit without complete shutdown; will lead to recovery on restart

# Allowed signal names for kill:
#   ABRT HUP INT KILL QUIT TERM USR1 USR2

################################################################################
# postgres
#
# postgres is the PostgreSQL server.

# Usage:
#   postgres [OPTION]...

# Options:
#   -B NBUFFERS        number of shared buffers
#   -c NAME=VALUE      set run-time parameter
#   -C NAME            print value of run-time parameter, then exit
#   -d 1-5             debugging level
#   -D DATADIR         database directory
#   -e                 use European date input format (DMY)
#   -F                 turn fsync off
#   -h HOSTNAME        host name or IP address to listen on
#   -i                 enable TCP/IP connections
#   -k DIRECTORY       Unix-domain socket location
#   -l                 enable SSL connections
#   -N MAX-CONNECT     maximum number of allowed connections
#   -p PORT            port number to listen on
#   -s                 show statistics after each query
#   -S WORK-MEM        set amount of memory for sorts (in kB)
#   -V, --version      output version information, then exit
#   --NAME=VALUE       set run-time parameter
#   --describe-config  describe configuration parameters, then exit
#   -?, --help         show this help, then exit

# Developer options:
#   -f s|i|o|b|t|n|m|h forbid use of some plan types
#   -n                 do not reinitialize shared memory after abnormal exit
#   -O                 allow system table structure changes
#   -P                 disable system indexes
#   -t pa|pl|ex        show timings after each query
#   -T                 send SIGSTOP to all backend processes if one dies
#   -W NUM             wait NUM seconds to allow attach from a debugger

# Options for single-user mode:
#   --single           selects single-user mode (must be first argument)
#   DBNAME             database name (defaults to user name)
#   -d 0-5             override debugging level
#   -E                 echo statement before execution
#   -j                 do not use newline as interactive query delimiter
#   -r FILENAME        send stdout and stderr to given file

# Options for bootstrapping mode:
#   --boot             selects bootstrapping mode (must be first argument)
#   DBNAME             database name (mandatory argument in bootstrapping mode)
#   -r FILENAME        send stdout and stderr to given file
#   -x NUM             internal use

# Please read the documentation for the complete list of run-time
# configuration settings and how to set them on the command line or in
# the configuration file.

# Report bugs to <pgsql-bugs@lists.postgresql.org>.
# PostgreSQL home page: <https://www.postgresql.org/>
