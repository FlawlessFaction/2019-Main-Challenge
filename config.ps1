Configuration build {

    Import-DscResource -Module PendingReboot, ComputerManagementDsc

    Node $AllNodes.NodeName {

        LocalConfigurationManager
        {
            RebootNodeIfNeeded = $true
        }

        PendingReboot checkReboot
        {
            name = "flawless reboots plz"
        }

        Computer SetName
        {
            Name = $node.MachineName
        }

        WindowsFeature 'windows-internal-database'
        {
            Ensure = 'Present'
            Name   = 'Windows-Internal-Database'
        }

        WindowsFeature 'microsoftwindowspowershellv2root'
        {
            Ensure = 'absent'
            Name   = 'MicrosoftWindowsPowerShellV2Root'
        }

        WindowsFeature 'rsat-nlb'
        {
            Ensure = 'present'
            Name   = 'RSAT-NLB'
        }

        WindowsFeature 'nlb'
        {
            Ensure = 'presnet'
            Name   = 'NLB'
        }

        WindowsEventLog ApplicationEventlogSize
        {
            LogName            = 'Application'
            IsEnabled          = $true
            LogMode            = 'Retain'
            MaximumSizeInBytes = 4294967296KB
        }

    }
}


$ConfigData = @{
    AllNodes = @(
        @{
            NodeName    = 'localhost'
            MachineName = 'is01'
        }
    )
}

build -ConfigurationData $ConfigData
Set-DscLocalConfigurationManager -path .\BuildTest01 -Credential $startCred -ComputerName localhost -Verbose
Start-DscConfiguration -Wait -Path .\BuildTest01 -Credential $startCred -Verbose -Force -ComputerName localhost