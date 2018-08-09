#!/usr/bin/env python3

"""
BASICS

Creates a new user, specified by their token
If the user already exists, an error result is returned
"""

import os
from flask import Flask, request
import base_functions as bf

app = Flask(__name__)
GREYFISH_FOLDER = os.environ['greyfish_path']+"/sandbox/"


# toktok (str): User token
@app.route("/grey/create_user/<toktok>/<gkey>")
def create_user(toktok, gkey):


    if not bf.valid_key(gkey):
        return "INVALID key, cannot create a new user"

    try:
        os.makedirs(GREYFISH_FOLDER+'DIR_'+str(toktok))
        return "Greyfish cloud storage now available"
    except:
        return "User already has an account"


if __name__ == '__main__':
   app.run(host = '0.0.0.0', port = 2002)
