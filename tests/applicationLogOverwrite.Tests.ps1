Describe 'applicationLogOverwright' {
    
    $computername = $env:COMPUTERNAME
    $cs = New-CimSession -ComputerName $computername

    #Application event log should not be able to overwright
    It "Application event log should not be overwrightable" {
            ($cs | Get-CimInstance -ClassName win32_NTEVentlogFile -filter "LogFileName = 'Application'").OverWritePolicy | Should be "Never"
    }

    $cs | Remove-CimSession
}
