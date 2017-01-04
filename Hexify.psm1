$scriptPath = Split-Path $MyInvocation.MyCommand.Path

Add-Type -Path "$scriptPath\Hexify.dll"

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
function ConvertTo-Hex([Parameter(Mandatory=$True, ValueFromPipeline=$True)][byte[]]$ByteArray) {
    return [LowLevelDesign.Hexify.Hex]::ToHexString($ByteArray)
}

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
function ConvertFrom-Hex([Parameter(Mandatory=$True, ValueFromPipeline=$True)][string]$HexString) {
    return [LowLevelDesign.Hexify.Hex]::FromHexString($HexString)
}

<#
.SYNOPSIS

    Nicely print a byte array.

.DESCRIPTION

    It is possible to pass the byte array through a pipeline.

.PARAMETER ByteArray

    A byte array to print.

.EXAMPLE

    (,$(gc -Encoding Byte .\Hexify\Hexify.psm1)) | Format-HexPrettyPrint

.INPUTS

    A byte array.

.OUTPUTS

    Nicely print byte array, with ASCII representation on the right side.
#>
function Format-HexPrettyPrint([Parameter(Mandatory=$True, ValueFromPipeline=$True)][byte[]]$ByteArray) {
    return [LowLevelDesign.Hexify.Hex]::PrettyPrint($ByteArray)
}
