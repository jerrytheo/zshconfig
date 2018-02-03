#!/bin/zsh

function _supp {
    errMsg=$( $* 2>& 1 )
    if ! $(echo $errMsg | grep -q 'Gtk-WARNING'); then
        echo $errMsg
    fi
}
