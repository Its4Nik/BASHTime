#!/bin/bash
#set -x
###

DEBUG=""
DEBUG_OUT=""
SEND_DEBUG=""


AUTO_OPEN=""

BASH_TIME_WORKDIR="/usr/share/bashtime"
BASH_TIME_CONF="${BASH_TIME_WORKDIR}/main.conf"

BASH_TIME_TARGET_TYPES="${BASH_TIME_WORKDIR}/targets"
BASH_TIME_TARGET_TYPES_LIST="${BASH_TIME_WORKDIR}/type-list.conf"

BASH_TIME_ALERTS="./alerts"

BASH_TIME_DISCORD_ALERT="${BASH_TIME_ALERTS}/discord-alert.sh"

### Source all kind of things:
#source ${BASH_TIME_WORKDIR}functions.sh
source ./functions.sh
source ./alerts/discord-alert.sh



read_options $@
debug_out "Read all User defined parameters"


debug_out "Sourced functions"
### Define Target directorys here:
# Inside the type-list.conf write it like this:
# ping.sh "This will send a simple ping with the ping command"
#
# This way there will be a simple way to add descriptions, you can also add comments with a #



# The Output for those commands should be like this (there will be more metrics added):
# UP;RTT=13ms
# or
# DOWN;RTT=13ms

get_types
debug_out "Read all different monitor types"

###

do_if_debug write_crontab


if [[ -n "$AUTO_OPEN" ]]; then
    width="$(tput cols)"

    for((i=0;i<$width;i++));do
        echo -n "_"
    done

    echo "Debug output:"

    echo -e "\n"

    cat "$DEBUG_OUT"
fi

read -n 1

#cat $DEBUG_OUT
echo "$DEBUG_OUT"
send_log_discord "$DEBUG_OUT"