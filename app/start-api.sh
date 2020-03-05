#!/bin/bash

# This is suitable for Red Hat, CentOS and similar distrubtions
# It will not work on Ubuntu or other Debian-stylee distrubtions!

# The purpose of this script is to read the environment.env file to read the predefined environment variables
# Please make sure this file is ending the a new line

execute() {
    echo "Starting API process..."
    exec_cmd "node index.js"
}

execute

exit 0