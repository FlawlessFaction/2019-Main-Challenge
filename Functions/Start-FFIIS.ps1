function Start-FFIIS {
    <#
        .Synopsis
            Start IIS Related Functions
        .Description

        .Example
            Start-FFIIS -Path $Path

        .Link
        https://github.com/FlawlessFaction/2019-Main-Challenge

        .Notes
        Flawless Faction 2019

    #>
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path
    )

    begin {

    }

    process {
        try {
            Get-WebApplication | Start-WebAppPool
        } catch {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end {

    }
}
