#!/bin/bash

while true
do
  status=$(nordvpn status | grep -i status | cut -d ':' -f 2 | tr -d '[:space:]')
  if [[ "$status" != "Connected" ]]
  then
    nmcli n off
    printf "VPN connection lost.  Killed network..."
    sleep 1
    break
  fi
  sleep .25
done
 
