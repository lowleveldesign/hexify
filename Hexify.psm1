function ConvertTo-Hex {
<#
.SYNOPSIS

    Converts a byte array to its HEX representation.

.DESCRIPTION

    It is possible to pass the byte array through a pipeline.

.PARAMETER ByteArray

    A byte array to convert.

.EXAMPLE

    ConvertTo-Hex @(1,2,3)

.INPUTS

    Byte array

.OUTPUTS

    HEX representation of the array
#>

    [CmdletBinding()] Param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$True)][Byte[]]$ByteArray
    )

    BEGIN 
    {
        $Buffer = @()
    }

    PROCESS {
        foreach ($Byte in $ByteArray) {
            $Buffer += $Byte
        }
    }

    END 
    {
        "0x$([LowLevelDesign.Hexify.Hex]::ToHexString($Buffer))"
    }
}

function ConvertFrom-Hex {
<#
.SYNOPSIS

    Converts a HEX string to a byte array.

.DESCRIPTION

    It is possible to pass the HEX string through a pipeline.

.PARAMETER HexString

    A HEX string to convert.

.EXAMPLE

    ConvertFrom-Hex 010203

.INPUTS

    A HEX string.

.OUTPUTS

    Byte array represented by the HEX string.
#>
    [CmdletBinding()] Param(
        [Parameter(Mandatory=$True, ValueFromPipeline=$True)][string]$HexString
    )

    BEGIN {}

    PROCESS 
    { 
        [LowLevelDesign.Hexify.Hex]::FromHexString($HexString)
    }

    END {}
}

function Format-HexPrettyPrint {
<#
.SYNOPSIS

    Nicely print a byte array.

.DESCRIPTION

    It is possible to pass the byte array through a pipeline.

.PARAMETER ByteArray

    A byte array to print.

.EXAMPLE

    gc -Encoding Byte .\Hexify\Hexify.psm1 | Format-HexPrettyPrint

.INPUTS

    A byte array.

.OUTPUTS

    Nicely print byte array, with ASCII representation on the right side.
#>
    [CmdletBinding()] Param(
        [Parameter(Mandatory=$True, ValueFromPipeline=$True)][Byte[]]$ByteArray
    )

    BEGIN
    {
        $Buffer = @()
    }

    PROCESS 
    {
        foreach ($Byte in $ByteArray) {
            $Buffer += $Byte
        }
    }

    END
    {
        [LowLevelDesign.Hexify.Hex]::PrettyPrint($Buffer)
    }
}
