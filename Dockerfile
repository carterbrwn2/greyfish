##########################
# BASICS
# 
# An alpine server with python3 installed, useful only as a cloud storage server
# Not designed for front-end interfaces
#########################

FROM python:3.6-alpine


# Copies the necessary files
COPY base_functions.py  /grey/base_functions.py
COPY new_user.py        /grey/new_user.py
COPY reef_results.py    /grey/reef_results.py
COPY reef_regular.py    /grey/reef_regular.py
COPY API_Daemon.sh      /grey/API_Daemon.sh


# Installs the necessary packages
# Bash for convenience
RUN apk update && apk add bash && mkdir -p /greyfish/sandbox && pip3 install Flask requests &&\
	chmod +x /grey/new_user.py /grey/reef_regular.py /grey/reef_results.py /grey/API_Daemon.sh


WORKDIR /greyfish