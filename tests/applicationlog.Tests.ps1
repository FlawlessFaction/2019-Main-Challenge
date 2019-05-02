Describe 'applicationLogSize' {
    
    $computername = $env:COMPUTERNAME
    $cs = New-CimSession -ComputerName $computername

    #Application event log set to 4GB
    It "Application event log should be at least 4GB in size" {
            ($cs | Get-CimInstance -ClassName win32_NTEVentlogFile -filter "LogFileName = 'Application'").FileSize | Should beGreaterThan 4GB
    }

    $cs | Remove-CimSession
}
