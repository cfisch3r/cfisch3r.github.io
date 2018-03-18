#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
    ncftp -u "$USERNAME" -p "$PASSWORD" "$HOST"<<EOF
    rm old_site
    mv site old_site
    mkdir site
    quit
EOF

    cd _site || exit
    ncftpput -R -v -u "$USERNAME" -p "$PASSWORD" "$HOST" /site .
fi
