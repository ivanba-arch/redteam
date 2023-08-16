#!/bin/bash
clear
echo    LOADING . . .
pwsh -Command "IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); Install-AtomicRedTeam -getAtomics" -Force > /tmp/pwsh_output.log 2>&1
echo "Script completed" > /tmp/script_status.log
