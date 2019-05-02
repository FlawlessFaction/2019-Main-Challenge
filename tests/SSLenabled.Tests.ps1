Param(
    $computername = $env:computername
)
Describe 'SSL Enabled' {

    It 'is listening on port 443 with SSL' {
        (Invoke-WebRequest "https://$computername").statuscode -eq 200 |
            Should -BeTrue
    }
}
