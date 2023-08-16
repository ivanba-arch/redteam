#!/bin/bash
clear
echo
echo
echo
echo           /$$$$$$ /$$   /$$ /$$    /$$  /$$$$$$  /$$   /$$ /$$$$$$$$        /$$$$$$  /$$$$$$$$ /$$$$$$  /$$      /$$ /$$$$$$  /$$$$$$ 
echo          |_  $$_/| $$$ | $$| $$   | $$ /$$__  $$| $$  /$$/| $$_____/       /$$__  $$|__  $$__//$$__  $$| $$$    /$$$|_  $$_/ /$$__  $$
echo            | $$  | $$$$| $$| $$   | $$| $$  \ $$| $$ /$$/ | $$            | $$  \ $$   | $$  | $$  \ $$| $$$$  /$$$$  | $$  | $$  \__/
echo            | $$  | $$ $$ $$|  $$ / $$/| $$  | $$| $$$$$/  | $$$$$         | $$$$$$$$   | $$  | $$  | $$| $$ $$/$$ $$  | $$  | $$      
echo            | $$  | $$  $$$$ \  $$ $$/ | $$  | $$| $$  $$  | $$__/         | $$__  $$   | $$  | $$  | $$| $$  $$$| $$  | $$  | $$      
echo            | $$  | $$\  $$$  \  $$$/  | $$  | $$| $$\  $$ | $$            | $$  | $$   | $$  | $$  | $$| $$\  $ | $$  | $$  | $$    $$
echo           /$$$$$$| $$ \  $$   \  $/   |  $$$$$$/| $$ \  $$| $$$$$$$$      | $$  | $$   | $$  |  $$$$$$/| $$ \/  | $$ /$$$$$$|  $$$$$$/
echo          |______/|__/  \__/    \_/     \______/ |__/  \__/|________/      |__/  |__/   |__/   \______/ |__/     |__/|______/ \______/
echo
echo          LOADING . . .
echo
echo          Please wait, this could take a few minutes
echo 
pwsh -Command "IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); Install-AtomicRedTeam -getAtomics" -Force
echo "Script completed" > /tmp/install_remote_d.log
echo
echo
echo
