#!/bin/bash

uri="$(python2 -c "import config_server; print config_server.config_server_settings['remote']")"

cd build

lftp "$uri" <<EOF
set xfer:clobber on
get scenes.txt
mput *.txt
EOF

cd ..
