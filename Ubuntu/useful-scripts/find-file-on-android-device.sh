#!/bin/bash

echo "Searching for: $1, in your android device."

adb shell ls -R / |
    while read line
    do
            line=$(echo $line | tr -d '\r')

            if [[ "$line" =~ ^/.*:$ ]]
            then
                    dir=${line%:}

            elif [[ "$line" = "opendir failed, Permission denied" ]]
            then
                    echo "find: $dir: Permission denied"

            else
                if [[ "$dir" = "/" ]]; then dir=""; fi

                echo "$dir/$line"
            fi
    done | grep --color=always -e "$1"
