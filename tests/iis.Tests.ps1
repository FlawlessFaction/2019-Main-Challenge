Param(
    $computername = $env:computername
)

Describe 'iis Website' {

    It 'is listening on port 443' {
        (Invoke-WebRequest "https://$computername").statuscode -eq 200 | Should be $true
}
}