#! /bin/bash
# use `tar xzvf whoami-home-backup-?????.tar.gz` to restore

function backup-home(){
    cd /media/$(whoami)/Snapshot/
    tar czvf $(whoami)-home-backup-$(date +%F).tar.gz /home/$(whoami)/;
}
