Describe 'NetworkLoadBalancing' {

    $testCases = @(
        @{feature = 'rsat-nlb' },
        @{feature = 'nlb' }
    )

    It 'Feature <feature> is installed' -TestCases $testCases {
        param($Feature)
        Get-WindowsFeature $feature -ErrorAction SilentlyContinue |
            Should -Not -BeNullOrEmpty
    }
}
