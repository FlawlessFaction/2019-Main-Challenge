Describe 'Function ConstrainedJeaEndpoint' {

    It 'Config is valid' {
        Test-PSSessionConfigurationFile $PSScriptRoot/../configurations/JEAConfig.pssc
    }

    It 'Installed config is valid' {
       $path =  (Get-PSSessionConfiguration -Name $name).ConfigFilePath
       Test-PSSessionConfigurationFile $path
    }
}
