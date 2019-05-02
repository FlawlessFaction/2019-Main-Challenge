Configuration build {

    Import-DscResource -Module PendingReboot, ComputerManagementDsc, xWebAdministration, PSDesiredStateConfiguration

    Node $AllNodes.NodeName {

        LocalConfigurationManager {
            RebootNodeIfNeeded = $true
        }

        script SSL {
            GetScript = {
                Get-ChildItem cert:\LocalMachine\My | Where-Object {
                    $_.Subject -match "flawless\.com"
                }
            }
            SetScript = {
                Import-Module PKI
                New-SelfSignedCertificate -CertStoreLocation Cert:\LocalMachine\My -DnsName "flawless.com"
            }
            TestScript = {
                $Cert = Get-ChildItem cert:\LocalMachine\My | Where-Object {
                    $_.Subject -match "flawless\.com"
                }
                $Cert.Count -gt 0
            }
        }

        PendingReboot checkReboot {
            name = "flawless reboots plz"
        }

        Computer SetName {
            Name = $node.MachineName
        }

        WindowsFeature 'windows-internal-database' {
            Ensure = 'Present'
            Name   = 'Windows-Internal-Database'
        }

        WindowsFeature 'microsoftwindowspowershellv2root' {
            Ensure = 'absent'
            Name   = 'MicrosoftWindowsPowerShellV2Root'
        }

        WindowsFeature 'PowerShell-V2' {
            Ensure = 'absent'
            Name   = 'PowerShell-V2'
        }

        WindowsFeature 'rsat-nlb' {
            Ensure = 'present'
            Name   = 'RSAT-NLB'
        }

        WindowsFeature 'nlb' {
            Ensure = 'presnet'
            Name   = 'NLB'
        }

        WindowsEventLog ApplicationEventlogSize {
            LogName            = 'Application'
            IsEnabled          = $true
            LogMode            = 'Retain'
            MaximumSizeInBytes = 4294967296KB
        }

        xWebSiteDefaults WebServer {
            Applyto                = 'Machine'
            Logformat              = 'IIS'
            LogDirectory           = 'C:\inetpub\logs\LogFiles'
            TraceLogDirectory      = 'c:\inetpub\logs\logfiles'
            DefaultApplicationPool = 'DefaultAppPool'
            AllowSubDirConfig      = 'true'
        }

        xWebsite FlawlessdotCom {
            Name            =  $node.websiteName
            PhysicalPath    = 'c:\inetpub\flawlessdotcom'
            State           = 'started'
            BindingInfo     = @(
                MSFT_xWebBindingInformation {
                    Protocol              = "HTTPS"
                    Port                  = 443
                    CertificateSubject    = $node.CertSubject
                    CertificateStoreName  = "MY"
                }
            )
            ApplicationPool = 'DefaultAppPool'
            Ensure          = Present
        }
    }
}

$ConfigData = @{
    AllNodes = @(
        @{
            NodeName    = 'localhost'
            MachineName = 'is01'
            websiteName = 'flawlessfaction'
            CertSubject = 'CN=flawless.com'
        }
    )
}

build -ConfigurationData $ConfigData
Set-DscLocalConfigurationManager -path .\build -Credential $startCred -ComputerName localhost -Verbose
Start-DscConfiguration -Wait -Path .\build -Credential $startCred -Verbose -Force -ComputerName localhost