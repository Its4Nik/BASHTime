```
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
```
# ATTENTION!

## THIS SCRIPT DOES NOT WORK FOR NOW, THIS IS JUST MY CODEBASE

# BASHTime
I dont know why I did/do this to myself

## Features:

1. Monitoring screen (WIP)
2. Discord Alerts (WIP)
3. Discord Log exporting
4. "Offline Mode" - Wont connect to any network except your local network, if you use that for monitoring.
5. Easy uninstall (WIP)
6. Semi Automatic updates, one command (WIP)
7. Docker Container (WIP)
8. Add custom Monitors with BASH/C++/Python/... as long as it outputs the same Alert format

## Alert format:

1. UP;RTT=13ms
2. DOWN;RTT=?ms

## How do I add more Monitors?
### Option 1
Easy, when installing BASHTime asks you if you want a custom alias, choose yes.

Then afterwards to add Monitors just run `bashtime-add`, to edit `bashtime-edit`.

### Option 2
If you didn't accep the aliases navigate to `/usr/share/bashtime/bashtime-add.sh` or `/usr/share/bashtime/bashtime-edit.sh`.

### Option 3 (_unrecommended_)
Edit `type-list.conf`, and please add a Description.

Inside the type-list.conf write it like this:

ping.sh "This will send a simple ping with the ping command"

## Is it reliable? 
It depends, if you use it via crontab, yes.

If you just execute the Monitor it might be unstable due to my "perfect" coding skills.

## Are other alert functions possible?
Yes definetly, I really want to add NTFY since I use it with everything.

If you want different types of alerts do them yourself or ask me niceline in an Issue :D

# Contributing

If anyone is as insane as me and really wants to fall into the hole of what BASH is please keep in mind that all your code should be logical,
somewhat performant and there should be comments like everywhere, just so that other people can learn from it.

(Right now there aren't a lot of comments in my own written stuff I know but I'm gonna add them later... Moments before disaster...)
