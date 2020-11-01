function Get-YahtzeeUpper {
    [CmdletBinding(DefaultParameterSetName='Random')]
    param (
        [Parameter(ParameterSetName='Specific')]
        [array]
        $InputArray,

        [Parameter(ParameterSetName='Random')]
        [switch]
        $RandomArray
    )
<#
First we take an Array of 5 numbers (dicerolls)
- For each possible die result, tally up how many times this result came up
- For each possible die result, check the overall result of THISRESULT * Times it came up
- Spit out the highest possible number out of all of these
#>
    BEGIN {

        if($PSBoundParameters.ContainsKey('RandomArray')) {
            $Array = Get-Random -Minimum 1 -Maximum 6 -Count 5
        }
        elseif ($PSBoundParameters.ContainsKey('InputArray')) {
            $Array = $InputArray
        }

        $result = [PSCustomObject]@{
            one = 0
            two = 0
            three = 0
            four = 0
            five = 0
            six = 0
        }

    }
    PROCESS {

        # Here we fill the $result properties with values corresponding to how many times a certain result came up
        foreach ($item in $array) {
            switch ($item) {
                1 { $result.one =+ 1}
                2 { $result.two =+ 1}
                3 { $result.three =+ 1}
                4 { $result.four =+ 1}
                5 { $result.five =+ 1}
                6 { $result.six =+ 1}
            }

        }

        # Here we loop through each of the properties, and we multiply the dice roll by how many times it pops up, and store the result
        $result.psobject.Properties.name | ForEach-Object {
            Write-Output $_
        }

        return $result

    }
    END {

    }
    

}