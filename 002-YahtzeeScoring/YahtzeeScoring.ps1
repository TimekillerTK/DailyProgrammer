function Get-YahtzeeUpper {
    [CmdletBinding(DefaultParameterSetName = 'Random')]
    param (
        [Parameter(ParameterSetName = 'Specific')]
        [array]
        $InputArray,

        [Parameter(ParameterSetName = 'Random')]
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

        if ($PSBoundParameters.ContainsKey('RandomArray')) {
            $Array = Get-Random -Minimum 1 -Maximum 6 -Count 5
        }
        elseif ($PSBoundParameters.ContainsKey('InputArray')) {
            $Array = $InputArray
        }

        $result = @(
            [PSCustomObject]@{ Value = 1; Count = 0; Max = 0 }
            [PSCustomObject]@{ Value = 2; Count = 0; Max = 0 }
            [PSCustomObject]@{ Value = 3; Count = 0; Max = 0 }
            [PSCustomObject]@{ Value = 4; Count = 0; Max = 0 }
            [PSCustomObject]@{ Value = 5; Count = 0; Max = 0 }
            [PSCustomObject]@{ Value = 6; Count = 0; Max = 0 }
        )

    }
    PROCESS {

        # Here we fill the $result properties with values corresponding to how many times a certain result came up
        foreach ($item in $array) {
            switch ($item) {
                1 { $result[0].Count += 1 }
                2 { $result[1].Count += 1 }
                3 { $result[2].Count += 1 }
                4 { $result[3].Count += 1 }
                5 { $result[4].Count += 1 }
                6 { $result[5].Count += 1 }
            }

        }

        # Here we loop through each of the properties, and we multiply the dice roll by how many times it pops up, and store the result
        for ($i=0; $i -lt $result.Count ; $i++) {
            $result[$i].Max = $result[$i].Value * $result[$i].Count
        }

        # Here we store the highest
        $MaxNumber = $result | Measure-Object -Property Max -Maximum

        # Return the highest number
        return $MaxNumber.Maximum



    }
    END {

    }
    

}