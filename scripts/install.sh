#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Setup needed 32 libraries
echo -e "Installing required 32 libraries from Official Ubuntu Repos" && sleep 5
sudo dpkg --add-architecture i386 && sudo apt-get update
sudo apt-get install lib32gcci zlib1g:i386

# Set Install Dir
server_dir="$HOME/kf2-ds"

# download steamcmd
cd $HOME
echo -e "${RED}Deleting steamcmd & kf2-ds directories if they exist...${NC}" && sleep 2
rm -rf ~/steamcmd
rm -rf ~/kf2-ds
echo -e "${GREEN}Downloading & Installing SteamCmd...${NC}" && sleep 2
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
mkdir ~/steamcmd
tar -xvzf steamcmd_linux.tar.gz -C steamcmd
rm steamcmd_linux.tar.gz*
cd ~/steamcmd

# download srcds for kf2 (232130)
./steamcmd.sh +login anonymous +force_install_dir $server_dir +app_update 232130 validate +quit

# copy directories to server
#echo -e "${GREEN}Starting Setup Script...${NC}" && sleep 3
#sh $HOME/github/CSGO-SURF/scripts/setup.sh

# add start script
cp -f ~/github/CSGO-SURF/scripts/start.sh $server_dir