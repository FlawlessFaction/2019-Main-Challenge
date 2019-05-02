Describe 'SSL Enabled' {

    It 'is listening on port 443 with SSL' {
        (Invoke-WebRequest "https://$env:computername").statuscode -eq 200 |
            Should -BeTrue
    }

    foreach ($WebSite in Get-Website) {
        Context $WebSite {
            $SSLResult = Test-SslProtocol -ComputerName $WebSite -Port 443
            It 'Should have Signature Algorithm of sha256RSA' {
                $SSLResult.SignatureAlgorithm | Should Be 'sha256RSA'
            }
            It 'Should support TLS1.2' {
                $SSLResult.TLS12 | Should Be $True
            }
            It "Should not going to expire in $WarningThreshold days" {
                ($SSLResult.Certificate.NotAfter -gt (Get-Date).AddDays($WarningThreshold))| Should Be $True
            }
        }
    }
}