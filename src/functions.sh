#!/bin/bashs

if ! command -v lolcat &> /dev/null; then

echo "
██████╗  █████╗ ▄▄███▄▄·██╗  ██╗████████╗██╗███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║████╗ ████║██╔════╝
██████╔╝███████║███████╗███████║   ██║   ██║██╔████╔██║█████╗
██╔══██╗██╔══██║╚════██║██╔══██║   ██║   ██║██║╚██╔╝██║██╔══╝
██████╔╝██║  ██║███████║██║  ██║   ██║   ██║██║ ╚═╝ ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═▀▀▀══╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝

                                        ██╗████████╗███████╗███╗   ██╗██╗██╗  ██╗
                                        ██║╚══██╔══╝██╔════╝████╗  ██║██║██║ ██╔╝
                                        ██║   ██║   ███████╗██╔██╗ ██║██║█████╔╝
                                        ██║   ██║   ╚════██║██║╚██╗██║██║██╔═██╗
                                        ██║   ██║   ███████║██║ ╚████║██║██║  ██╗
                                        ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝

"
else

echo "
██████╗  █████╗ ▄▄███▄▄·██╗  ██╗████████╗██╗███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║████╗ ████║██╔════╝
██████╔╝███████║███████╗███████║   ██║   ██║██╔████╔██║█████╗
██╔══██╗██╔══██║╚════██║██╔══██║   ██║   ██║██║╚██╔╝██║██╔══╝
██████╔╝██║  ██║███████║██║  ██║   ██║   ██║██║ ╚═╝ ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═▀▀▀══╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝

                                        ██╗████████╗███████╗███╗   ██╗██╗██╗  ██╗
                                        ██║╚══██╔══╝██╔════╝████╗  ██║██║██║ ██╔╝
                                        ██║   ██║   ███████╗██╔██╗ ██║██║█████╔╝
                                        ██║   ██║   ╚════██║██║╚██╗██║██║██╔═██╗
                                        ██║   ██║   ███████║██║ ╚████║██║██║  ██╗
                                        ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝

" | lolcat

fi

debug_out(){
    if [[ $color_debug_file = "yes" ]]; then
        local ColorPrefix="\e[36m"
        local ColorGrey="\e[3;90m"
        local Reset="\e[0m"
    else
        local ColorPrefix=""
        local ColorGrey=""
        local Reset=""
    fi
    if [[ -z "${DEBUG_OUT}" ]]; then
        if [[ "$DEBUG" = "yes" ]]; then
            echo -e "[ \e[36mDEBUG\e[0m ]\e[96m$(get_time_debug)\e[0m: \e[3;90m${1}\e[0m"
        fi
    else
        echo -e "[ ${ColorPrefix}DEBUG${Reset} ]$(get_time_debug):${ColorGrey} ${1}${Reset}" >> $DEBUG_OUT
    fi
}

get_time_debug(){
    echo " $(date +"%H:%M:%S.%N")" | rev | cut -c 6- | rev
}

do_if_debug(){
    if [[ $color_debug_file = "yes" ]]; then
        local ColorPrefix="\e[36m"
        local ColorTimeRunning="\033[93;5m"
        local ColorTimeRan="\e[92m"
        local ColorGrey="\e[3;90m"
        local Reset="\e[0m"
    else
        local ColorPrefix=""
        local ColorTimeRunning=""
        local ColorTimeRan=""
        local ColorGrey=""
	local Reset=""
    fi

    if [[ -z "${DEBUG_OUT}" ]]; then
        if [[ "$DEBUG" = "yes" ]]; then
	    echo -e "[ \e[36m RUN \e[0m ]\033[93;5m$(get_time_debug)\e[0m: \e[3;90mRunning: \"${1}\"\e[0m"
            $1
	    echo -e "[ \e[36m RAN \e[0m ]\e[92m$(get_time_debug)\e[0m: \e[3;90mRan: \"${1}\"\e[0m"
        fi
    else
        echo -e "[  ${ColorPrefix}RUN${Reset}  ]${ColorTimeRunning}$(get_time_debug)${Reset}:${ColorGrey} ${1}${Reset}" >> $DEBUG_OUT
        $1
        echo -e "[  ${ColorPrefix}RAN${Reset}  ]${ColorTimeRan}$(get_time_debug)${Reset}:${ColorGrey} ${1}${Reset}" >> $DEBUG_OUT
    fi
}

get_types(){
    local i=0;
    IFS=
    while read types; do
        ((i++))
        echo "Type $i: $types"
    done < "${BASH_TIME_TARGET_TYPES_LIST}"
    echo "--- Count ---"
    cat "${BASH_TIME_TARGET_TYPES_LIST}" | wc -l
}

write_crontab(){
    while read types; do
        echo "$types" | awk '{print $1}'
    done < "${BASH_TIME_TARGET_TYPES_LIST}"
}

read_options(){
     for arg in "$@"; do
     local do_debug_out="$(echo "$arg" | grep "debug-out")"
     case $arg in
            -s)
                RUN setup
		exit 1
                ;;
            -d)
                RUN detached
		exit 1
                ;;
            -h)
                RUN help
		exit 1
                ;;
            -e)
                RUN edit
                ;;
            -ls)
                RUN list
                ;;
            -alert)
                RUN editAlerts
                ;;
            --debug)
                DEBUG="yes"
                ;;
            --locations)
                RUN fileLocations
                ;;
            --uninstall)
                RUN uninstall
                ;;
            --update)
                RUN update
                ;;
            --delete-data)
                RUN delData
                ;;
            --backup-data)
                RUN backup
                ;;
            --show-backup)
                RUN backupShow
                ;;
            --color)
                RUN colorDebug
                ;;
            --send-debug)
                SEND_DEBUG="yes"
		;;
            --auto-open)
                AUTO_OPEN="yes"
                ;;
            *)
		if [[ -n "$do_debug_out" ]]; then
			DEBUG_OUT="$(echo "$arg" | awk -F'=' '{print $2}')"

			echo "
██████╗  █████╗ ▄▄███▄▄·██╗  ██╗████████╗██╗███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║████╗ ████║██╔════╝
██████╔╝███████║███████╗███████║   ██║   ██║██╔████╔██║█████╗
██╔══██╗██╔══██║╚════██║██╔══██║   ██║   ██║██║╚██╔╝██║██╔══╝
██████╔╝██║  ██║███████║██║  ██║   ██║   ██║██║ ╚═╝ ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═▀▀▀══╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝

                                        ██╗████████╗███████╗███╗   ██╗██╗██╗  ██╗
                                        ██║╚══██╔══╝██╔════╝████╗  ██║██║██║ ██╔╝
                                        ██║   ██║   ███████╗██╔██╗ ██║██║█████╔╝
                                        ██║   ██║   ╚════██║██║╚██╗██║██║██╔═██╗
                                        ██║   ██║   ███████║██║ ╚████║██║██║  ██╗
                                        ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝

" >> $DEBUG_OUT
			echo "[ START ] $(date +"%T")" >> $DEBUG_OUT
                        echo "" >> $DEBUG_OUT
		fi
                RUN default
                ;;
        esac
    done
}


# Function to run all kind of things
RUN(){
        debug_out "RUN $1"
	case $1 in
		help)
		bash ./helper-scripts/help.sh
		;;
		fileLocations)
		echo "
BASH_TIME_WORKDIR="/usr/share/bashtime/"
BASH_TIME_CONF="${BASH_TIME_WORKDIR}/main.conf"

BASH_TIME_TARGET_TYPES="${BASH_TIME_WORKDIR}/targets"
BASH_TIME_TARGET_TYPES_LIST="${BASH_TIME_WORKDIR}/type-list.conf"
"
		    exit 1
		;;
                colorDebug)
		    color_debug_file="yes"
                ;;
                editAlerts)
                    debug_out "Running discord-alert.sh"
                    bash ${BASH_TIME_DISCORD_ALERT} edit
                ;;
	esac
}