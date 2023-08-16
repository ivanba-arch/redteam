#!/bin/bash
clear
echo    LOADING . . .
echo 
echo 
pwsh -Command "IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); Install-AtomicRedTeam -getAtomics" -Force
echo "Script completed" > /tmp/install_remote_d.log
