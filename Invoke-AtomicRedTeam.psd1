@{

    # Module manifest data
    RootModule        = 'Invoke-AtomicRedTeam.psm1'
    ModuleVersion     = '2.0.4'
    GUID              = '8f492621-18f8-432e-9532-b1d54d3e90bd'
    Author            = 'NN'
    CompanyName       = 'NN'  
    Copyright         = '(c) 2023 Your Company. All rights reserved.' 
    Description       = 'A PowerShell module that runs Atomic Red Team tests from yaml definition files.'
    PowerShellVersion = '5.0'
    RequiredModules   = @('powershell-yaml')
    ScriptsToProcess  = @('Private\AtomicClassSchema.ps1','Public\config.ps1')
    FunctionsToExport = @(
        'Invoke-AtomicTest',
        'Get-AtomicTechnique',
        'New-AtomicTechnique',
        'New-AtomicTest',
        'New-AtomicTestInputArgument',
        'New-AtomicTestDependency',
        'Start-AtomicGUI',
        'Stop-AtomicGUI',
        'Invoke-SetupAtomicRunner',
        'Invoke-GenerateNewSchedule',
        'Invoke-RefreshExistingSchedule',
        'Invoke-AtomicRunner',
        'Get-Schedule',
        'Invoke-KickoffAtomicRunner',
        'Get-PreferredIPAddress'
    )
    VariablesToExport = '*'
    NestedModules = @(
        "Public\Default-ExecutionLogger.psm1",
        "Public\Attire-ExecutionLogger.psm1",
        "Public\Syslog-ExecutionLogger.psm1",
        "Public\WinEvent-ExecutionLogger.psm1"
    )

    # Private data
    PrivateData       = @{
        PSData = @{
            Tags = @('Security', 'Defense')
            LicenseUri = 'https://github.com/ivanba-arch/redteam/blob/main/LICENSE.txt'  # Cambiar la URL de la licencia
            ProjectUri = 'https://github.com/ivanba-arch/redteam'  # Cambiar la URL del repositorio
            ReleaseNotes = @'
2.0.4
-----
* no notes

2.0.3
-----
* no notes

2.0.2
-----
* no notes

'@
        }
    }
}
