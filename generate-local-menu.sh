#!/bin/bash


if test -f /usr/share/xournalpp/ui/iconsColor-dark/hicolor/scalable/actions/xopp-tool-pencil.svg ; then
    echo "Found Xournal++ icon folder in /usr/share"
    xppuiicons=/usr/share/xournalpp/ui/iconsColor-dark
else
    echo "Using locate to find Xournal++ icon folder, this might take some seconds"
    xppuiicons=$(locate xournalpp/ui/iconsColor-dark | grep 'xournalpp/ui/iconsColor-dark$')
    if [ "$xppuiicons" = "" ] ; then
        echo "!!! No xournalpp/ui/iconsColor-dark folder found, you might need to run 'sudo updatedb' if you just installed xournalpp"
        exit
    fi
fi

cat src/menu.json \
    | sed "s@/home/brayden/Documents/git_cloned_dirs/Xournalpp_FlyPie@$(pwd)@g" \
    | sed "s@/home/brayden/Documents/git_cloned_dirs/xournalpp/ui/iconsColor-dark@$xppuiicons@g" \
          > local-menu.json


