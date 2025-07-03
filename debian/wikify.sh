#!/bin/sh

# This is the script used to fill the tables at:
#
#   https://wiki.debian.org/systemd-cron

set -e
set -u

wikify () {
    dir="$1"
    table="$2"

    echo "||<-3> '''$table''' ||"
    grep -v ^# "$table" | while read -r old new package
    do
	if [ -z "$package" ]
        then
            package="$old"
        fi
        echo "||DebianPkg:$package||/etc/cron.${dir}/${old} ||/lib/systemd/${new}.timer ||"
    done
    echo
}


wikify d crond2timer
wikify SCHEDULE part2timer
