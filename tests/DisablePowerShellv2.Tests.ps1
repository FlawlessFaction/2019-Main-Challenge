Describe 'Disabled PowerShell v2' {
    It 'Is Not installed' {
        Get-WindowsFeature PowerShell-V2 -ErrorAction SilentlyContinue |
            Should -Be -NullOrEmpty
    }
    It 'Is Not installed' {
        Get-WindowsFeature MicrosoftWindowsPowerShellV2Root -ErrorAction SilentlyContinue |
            Should -Be -NullOrEmpty
    }
}
