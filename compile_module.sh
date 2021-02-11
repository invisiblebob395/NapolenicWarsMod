#!/bin/bash

echo -n 1 > .compiling_in_progess

nice -n 19 ./build_module.sh
./upload_module.sh

python2 -c "import config_server; print config_server.config_server_settings['_build_no']" | head -c -1 > .build_no
echo -n 0 > .compiling_in_progess
