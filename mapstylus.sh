#!/bin/bash

echo 'Did you touch the stylus to the screen yet?'
while true; do
    read -p "(y)es/(n)o : " yn
    case $yn in
        [yY] ) echo proceeding..;
            break;;
        [nN] ) echo 'do it then';   
            exit;; 
        * ) echo invalid answer;;
    esac

done

# pull stylus id
stylusidraw=$(xinput | grep "Stylus Pen" | cut -d$'\t' -f 2)
stylusid=$(echo $stylusidraw | cut -d '=' -f 2)
echo 'stylus id is' $stylusid

#monitor value, check via xrandr --query, mine is eDP yours might not be

xinput map-to-output $stylusid eDP

echo 'complete'
