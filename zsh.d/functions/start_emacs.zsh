#!/bin/bash

set -E

function start_emacs() {
    if [[ ! $(ps aux | grep "emacs" | grep "daemon") ]]; then
        emacs --daemon
    fi

    emacsclient -c &
}
