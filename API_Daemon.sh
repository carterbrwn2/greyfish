#!/bin/bash


# Starts or ends the Reef communication APIs


if [ $# -eq 0 ]; then
   printf "No arguments provided, use -h flag for help\n"
   exit 1
fi


if [ $1 == "-h" ]; then
   printf "Automatic API daemon set-up\n"
   printf "Use flag -up to set-up the APIs\n"
   printf "Use flag -down to cancel the APIs\n"
   exit 1
fi


if [ $1 == "-up" ]; then 

   nohup /grey/new_user.py & \
         > /dev/null 2>&1 & echo $! > /grey/nnuu_api.txt
   nohup /grey/reef_regular.py & \
        > /dev/null 2>&1 & echo $!  > /grey/rerg_api.txt
   nohup /grey/reef_results.py & \
        > /dev/null 2>&1 & echo $!  > /grey/rers_api.txt

   printf "Reef APIs are now active\n"
fi


if [ $1 == "-down" ]; then 
   
   # Must compensate for the fork
   kill -9 $(($(cat /grey/nnuu_api.txt) - 1))
   kill -9 $(($(cat /grey/gfrg_api.txt) - 1))
   kill -9 $(($(cat /grey/gfrs_api.txt) - 1))

   printf "Reef APIs have been disconnected\n"
fi
