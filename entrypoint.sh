#!/bin/bash
sleep 2

cd /home/container

# Update CS16 Server
echo "Checking for updates!"
./steam/steamcmd.sh +@sSteamCmdForcePlatformBitness 32 +login anonymous +force_install_dir /home/container +app_update "90 -beta Beta" validate +quit

# Replace Startup Variables
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container# ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
