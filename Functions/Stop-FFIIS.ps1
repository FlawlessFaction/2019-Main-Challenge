function Stop-FFIIS {
    <#
        .Synopsis
            Stop IIS Related Functions
        .Description

        .Example
            Stop-FFIIS -Path $Path

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
            foreach ( $node in $Path ) {
                Write-Verbose $node

            }
        } catch {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end {

    }
}
