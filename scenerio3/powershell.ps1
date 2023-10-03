function Get-NestedObjectValue {
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Hashtable] $Object,

        [Parameter(Mandatory = $true)]
        [string] $Key
    )

    $keys = $Key -split '/'
    $currentObject = $Object

    foreach ($k in $keys) {
        if ($currentObject.ContainsKey($k)) {
            $currentObject = $currentObject[$k]
        } else {
            Write-Host "Key '$Key' not found."
            return $null
        }
    }

    return $currentObject
}

# Example usage:
$object1 = @{
    "a" = @{
        "b" = @{
            "c" = "d"
        }
    }
}

$key1 = "a/b/c"
$key2 = "x/y/z"

$value1 = Get-NestedObjectValue -Object $object1 -Key $key1
$value2 = Get-NestedObjectValue -Object $object2 -Key $key2

Write-Host "Value for key '$key1': $value1"
Write-Host "Value for key '$key2': $value2"
