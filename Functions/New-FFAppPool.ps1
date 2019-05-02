function New-FFAppPool {
    <#
        .Synopsis
        Creates a new FF Application Pool
        .Description

        .Example
        New-FFAppPool -Path $Path

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
        $Name
    )

    begin {

    }

    process {
        try {
            New-WebAppPool -Name $Name
        } catch {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end {

    }
}
