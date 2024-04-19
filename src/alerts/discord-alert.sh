#!/bin/bash

WEBHOOK="alerts/discord.conf"

send_log_discord(){

    cp $1 /tmp/logForDc.txt
    cat /tmp/logForDc.txt

    curl \
       -F "payload_json={\"username\": \"BASHTime\", \"content\": \":notepad_spiral: Hey there, I got something for you :notepad_spiral:\"}" \
       -F "file1=@/tmp/logForDc.txt" \
       $(cat $WEBHOOK)

}

getwebhook(){
    if [[ -f "$WEBHOOK" ]]; then
        if [[ -s "$WEBHOOK" ]]; then
#            debug_out "Webhook exists"
             echo "" > /dev/null
	else
#            debug_out "Asking user for Webhook"
            local webhook_temp=""
            echo "Please paste your discord webhook here"
            read -p "$ " webhook_temp
            echo
            echo "Is this correct?"
            echo "# $webhook_temp"
            read -n 1 -p "(y/n) " confirm
            echo
            case $confirm in
                 y|Y)
                 echo "$webhook_temp" > $WEBHOOK
                 ;;
                 *)
                 getwebhook
                 ;;
            esac

            echo
            read -p "Send test message? (y/n)? " -n 1 confirm
            echo
            case $confirm in
                 y|Y)
                 sendwebhook "Hello :wave:, this is a test Message! \n\nThis is how your logs could look like:\n@UPTIME-MONITOR SERVICE is down, IP/Doman: https://example.org" $(cat $WEBHOOK) > /dev/null
                 ;;
                 *)
                 echo "" > /dev/null
                 ;;
            esac
        fi
    else
        touch $WEBHOOK
        getwebhook
    fi
}

sendwebhook(){
    curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"username\": \"BASHTime\", \"content\": \"$1\"}" $(cat $WEBHOOK) > /dev/null
}

editwebhook(){
    echo
    echo "Editing Discord Webhook..."
    echo "Your webhook:"
    cat  $WEBHOOK
    read -n 1 -p "Do you want to edit (e), delete (d), test (t),or exit (q)? " option
    echo
    case $option in
        e|E)
#            debug_out "Creating new webhook and deleting old one"
            rm "$WEBHOOK"
            getwebhook
#            debug_out "Done"
            ;;
        d|D)
#            debug_out "Deleting Webhook"
            rm "$WEBHOOK"
            echo "Deleted $WEBHOOK"
#            debug_out "Done"
            ;;
        t|T)
            sendwebhook "Hello :wave:, this is a test Message! \n\nThis is how your logs could look like:\n@UPTIME-MONITOR SERVICE is down, IP/Doman: https://example.org"
            ;;
        *)
            echo "Exiting"
            ;;
     esac
}

if [[ $1 = "edit" ]]; then
    if [[ -f "$WEBHOOK" ]]; then
#        debug_out "Run editwebhook"
        editwebhook
#        debug_out "Done"
    else
#        debug_out "Run getwebhook"
        getwebhook
#        debug_out "Done"
    fi
fi