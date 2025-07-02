#!/usr/bin/env bash

# Copyright (c) 2021-2025 community-scripts ORG
# Author: [YourUserName]
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: [SOURCE_URL]

# Import Functions und Setup
source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

# Installing Dependencies
msg_info "Installing Dependencies"
$STD apt-get install -y \
  curl
msg_ok "Installed Dependencies"

# Setup TVHeadend
msg_info "Setting up TVHeadend"
$STD curl -1sLf 'https://dl.cloudsmith.io/public/tvheadend/tvheadend/setup.deb.sh' | sudo -E bash
$STD apt-get update
$STD apt-get install -y tvheadend

# Cleaning up
msg_info "Cleaning up"
$STD apt-get -y autoremove
$STD apt-get -y autoclean
msg_ok "Cleaned"
