#!/usr/bin/env bash
source <(curl -fsSL https://raw.githubusercontent.com/Fabio1202/ProxmoxVE-HelperScripts/refs/heads/add-tvheadend-ct/misc/build.func)
# Copyright (c) 2021-2025 community-scripts ORG
# Author: [YourUserName]
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: [SOURCE_URL]

# App Default Values
# Name of the app (e.g. Google, Adventurelog, Apache-Guacamole"
APP="TVHeadend"
# Tags for Proxmox VE, maximum 2 pcs., no spaces allowed, separated by a semicolon ; (e.g. database | adblock;dhcp)
var_tags="${var_tags:-media;streaming}"
# Number of cores (1-X) (e.g. 4) - default are 2
var_cpu="${var_cpu:-2}"
# Amount of used RAM in MB (e.g. 2048 or 4096)
var_ram="${var_ram:-1024}"
# Amount of used disk space in GB (e.g. 4 or 10)
var_disk="${var_disk:-4}"
# Default OS (e.g. debian, ubuntu, alpine)
var_os="${var_os:-debian}"
# Default OS version (e.g. 12 for debian, 24.04 for ubuntu, 3.20 for alpine)
var_version="${var_version:-12}"
# 1 = unprivileged container, 0 = privileged container
var_unprivileged="${var_unprivileged:-1}"

header_info "$APP"
variables
color
catch_errors

function update_script() {
    msg_error "Not supported"
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:9981${CL}"
