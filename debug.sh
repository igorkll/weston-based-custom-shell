#!/bin/bash

./install_weston_configuration.sh
weston --backend=x11 --use-pixman
