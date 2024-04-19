#!/bin/bash

# Help function
clear
DATE="$(date +"%d-%m-%Y")"

NC="\e[0m"
LB="\e[1;34m"
YL="\e[1;33;4;44m"

echo -e "
Welcome to BA\$HTime
An Uptime monitor purley in BA\$H.

To install bashtime clone the repo and run config.sh, this will set up some
aliases in /root/.bash_aliases (other shells comming!).

Usage:

${NC}bashtime              ${NC}|${NC}   Opens BASHTimes Interface to monitor
${LB}bashtime <option(s)>  ${NC}|${LB}   Might open BASHTime monitor, if the option is 
${LB}                      ${NC}|${LB}   designed that way
${NC}bashtime alerts       ${NC}|${NC}   Only Shows Alert message and sends terminal \"ding\" 
${NC}                      ${NC}|${NC}
${NC}- - - - - - - - - - - ${NC} ${NC} - - - - - - - - -
${NC}                      ${NC}|${NC}
${NC}bashtime ...          ${NC}|${NC}
${NC}                      ${NC}|${NC}
${NC}Main options:         ${NC}|${NC}
${NC}    -s                ${NC}|${NC}   Sets up monitors, themes and adds alias (optional)
${LB}    -d                ${NC}|${LB}   runs detached (only alert capabilities) via systemd
${NC}    -h                ${NC}|${NC}   shows this text
${LB}    -e                ${NC}|${LB}   Edits monitors
${NC}    -ls               ${NC}|${NC}   Lists all Monitors
${LB}    -alert            ${NC}|${LB}   Toggles discord webhook alert <and/or> configures
${LB}                      ${NC}|${LB}   said webhook
${NC}                      ${NC}|
${NC}- - - - - - - - - - - ${NC} ${NC} - - - - - - - - -
${NC}                      ${NC}|${NC}
${NC}Extra options:        ${NC}|${NC}
${NC}    --debug           ${NC}|${NC}   enables debug output.
${LB}    --debug-out=/file ${NC}|${LB}   writes debug output to this location.
${NC}    --locations       ${NC}|${NC}   shows all file locations.
${LB}    --uninstall       ${NC}|${LB}   uninstalls bashtime and deletes it configuration
${NC}    --update          ${NC}|${NC}   compares versions from github.com/its4nik/bashtime
${NC}                      ${NC}|${NC}   and updates.
${LB}    --delete-data     ${NC}|${LB}   resets the data inside bashtimes db (textfile)
${NC}    --backup-data     ${NC}|${NC}   creates a backup-$DATE.txt.
${LB}    --show-backup     ${NC}|${LB}   shows all backups which have been created and
${LB}                      ${NC}|${LB}   deleted.
${NC}    --show-debug-end  ${NC}|${NC}   Shows debug file at the end.
${LB}    --color           ${NC}|${LB}   Colorises the debug output, useful if you read it with \"cat\".
${NC}    --auto-open       ${NC}|${NC}   Opens the logs right after execution, useful for debbuging while development.
${NC}                      ${NC}|
${NC}- - - - - - - - - - - ${NC} ${NC} - - - - - - - -
${NC}More Infos:
${NC}${YL}https://github.com/its4nik/bashtime${NC}
${NC}"