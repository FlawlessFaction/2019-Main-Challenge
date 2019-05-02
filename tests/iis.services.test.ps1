Describe "IIS-Service" {
    Context "IIS-Service running" {
        It "Iisadmin running" {
            {Get-Service -Name "Iisadmin" -ErrorAction Stop} | Should -Not -Throw
        }
        It "Msftpsvc running" {
            {Get-Service -Name "Msftpsvc" -ErrorAction Stop} | Should -Not -Throw
        }
        It "Nntpsvc running" {
            {Get-Service -Name "Nntpsvc" -ErrorAction Stop} | Should -Not -Throw
        }
        It "Smtpsvc running" {
            {Get-Service -Name "Smtpsvc" -ErrorAction Stop} | Should -Not -Throw
        }
        It "W3svc running" {
            {Get-Service -Name "W3svc" -ErrorAction Stop} | Should -Not -Throw
        }
    }
}