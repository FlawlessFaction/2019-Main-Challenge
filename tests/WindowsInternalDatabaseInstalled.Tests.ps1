Describe 'Windows Internal Database Installed' {

    It 'Feature is installed' {
        Get-WindowsFeature Windows-Internal-Database -ErrorAction SilentlyContinue |
            Should -Not -BeNullOrEmpty
    }
}
