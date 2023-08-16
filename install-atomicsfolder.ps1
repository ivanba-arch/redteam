function Install-AtomicsFolder {

    <#
    .SYNOPSIS

        This is a simple script to download the atttack definitions in the "atomics" folder of the Red Canary Atomic Red Team project.

        License: MIT License
        Required Dependencies: powershell-yaml
        Optional Dependencies: None

    .PARAMETER DownloadPath

        Specifies the desired path to download atomics zip archive to.

    .PARAMETER InstallPath

        Specifies the desired path for where to unzip the atomics folder.

    .PARAMETER Force

        Delete the existing atomics folder before installation if it exists.

    .EXAMPLE

        Install atomics folder
        PS> Install-AtomicsFolder.ps1

    .NOTES

        Use the '-Verbose' option to print detailed information.

#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $False, Position = 0)]
        [string]$InstallPath = $( if ($IsLinux -or $IsMacOS) { $Env:HOME + "/AtomicRedTeam" } else { $env:HOMEDRIVE + "\AtomicRedTeam" }),

        [Parameter(Mandatory = $False, Position = 1)]
        [string]$DownloadPath = $InstallPath,

        [Parameter(Mandatory = $False, Position = 2)]
        [string]$RepoOwner = "ivanba-arch",  # Cambiar al nombre de tu usuario de GitHub

        [Parameter(Mandatory = $False, Position = 3)]
        [string]$Branch = "main",  # Cambiar al nombre de la rama correspondiente

        [Parameter(Mandatory = $False)]
        [switch]$Force = $False, # eliminar la carpeta atomics existente antes de la instalación si existe

        [Parameter(Mandatory = $False)]
        [switch]$NoPayloads = $False
    )

    Try {
        $InstallPathwAtomics = Join-Path $InstallPath "atomics"
        if ($Force -or -Not (Test-Path -Path $InstallPathwAtomics)) {
            write-verbose "Directory Creation"
            if ($Force) {
                Try { 
                    if ((Test-Path $InstallPathwAtomics) -and (-not $NoPayloads)) { Remove-Item -Path $InstallPathwAtomics -Recurse -Force -ErrorAction Stop | Out-Null }
                }
                Catch {
                    Write-Host -ForegroundColor Red $_.Exception.Message
                    return
                }
            }
            if (-not (Test-Path $InstallPath)) { New-Item -ItemType directory -Path $InstallPath | Out-Null }

            $url = "https://raw.githubusercontent.com/$RepoOwner/redteam/main/install-atomicsfolder.ps1"  # Cambiar la URL a la ubicación correcta de tu repositorio
            $path = Join-Path $DownloadPath "$Branch-install-atomicsfolder.ps1"  # Cambiar el nombre del archivo de acuerdo con tu estructura

            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            write-verbose "Beginning download of atomics folder script from Github"
            Invoke-WebRequest $url -OutFile $path

            write-verbose "Running atomics folder script"
            . $path  # Ejecutar el script de la carpeta atomics descargado

            Write-Host "Atomic Red Team Atomics Folder installation is complete." -Fore Yellow
        }
        else {
            Write-Host -ForegroundColor Yellow "An atomics folder already exists at $InstallPathwAtomics. No changes were made."
            Write-Host -ForegroundColor Cyan "Try the installation again with the '-Force' parameter if you want to delete the existing installation and re-install."
            Write-Host -ForegroundColor Red "Warning: All files within the atomics folder ($InstallPathwAtomics) will be deleted when using the '-Force' parameter."
        }
    }
    Catch {
        Write-Error "Installation of the AtomicsFolder Failed."
        Write-Host $_.Exception.Message`n
    }
}
