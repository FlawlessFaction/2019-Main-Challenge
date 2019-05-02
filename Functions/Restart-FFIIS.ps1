function Restart-FFIIS {
    <#
        .Synopsis

        .Description

        .Example
        Restart-FFIIS -Path $Path

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
