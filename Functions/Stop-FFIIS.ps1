function Stop-FFIIS {
    <#
        .Synopsis
            Stop IIS Related Functions
        .Description

        .Example
            Stop-FFIIS -Path $Path

        .Notes

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
