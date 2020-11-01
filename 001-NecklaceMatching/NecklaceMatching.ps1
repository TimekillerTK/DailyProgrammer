# Challenge: https://www.reddit.com/r/dailyprogrammer/comments/ffxabb/20200309_challenge_383_easy_necklace_matching/

<# 
Created two different parameter sets here for the two cases:
1. Parameter set for checking wether input and output strings match (according to necklace matching task)
2. Checks how many times a pattern will repeat as we move beads along the necklace
#>
function Get-NecklaceMatch {
    [CmdletBinding(DefaultParameterSetName='InputOutput')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'InputOutput')]
        [Parameter(ParameterSetName = 'RepeatNumber')]
        [AllowEmptyString()]
        [string]
        $InputString,
        
        [Parameter(ParameterSetName = 'InputOutput')]
        [AllowEmptyString()]
        [string]
        $OutputString,
        
        [Parameter(Mandatory = $true, ParameterSetName = 'RepeatNumber')]
        [switch]
        $RepeatNumber
    )
    BEGIN {
    
        # This is needed to count an empty string in the inputstring as a '1', which is a requirement for one of our test cases
        if ($InputString -eq ""){
            $RepeatNumberVal = 1
        } else {
            $RepeatNumberVal = 0
        }

    } #begin
    PROCESS {
        # Should count how many iterations it has at the beginning
        # Move last character to front
        # Repeat until string is equal to input string (returning $false) while checking each result for whether it matches OutputString.
        # If it does, break the loop and return $true
        
        $newstring = $InputString
        
        # String of n letters = $InputString.count
        # Move a letter 1 time, check if $newstring matches $InputString
        # If yes, $count + 1
        # Once completed, spit out the $count

        # This is needed to reset the count for the Pester test
        $count = 0

        While ($count -ne $InputString.Length) {

            $count += 1
            
            # Converts strings into char array
            $array = $newstring.ToCharArray()

            switch ($InputString.Length) {
                {$PSItem -gt 1} {

                    # marks the last object of the array
                    $character = $array[-1]

                    # Selects all objects except the last one
                    $arraywithoutchar = $array[0..($array.Count - 2)]
    
                    # moves $character to the front of the array
                    $tmp = , $character + $arraywithoutchar
    
                    # joins all values in array to a string
                    $newstring = -join $tmp

                    # Counts repeating patterns
                    if ($newstring -eq $InputString) {
                        $RepeatNumberVal++
                    }
                    
                    if ($PSBoundParameters.ContainsKey('OutputString')) {
                        if ($newstring -eq $OutputString) {
                            return $true
                            break
                        }
                    }

                }
                {$PSItem -le 1} { 

                    $RepeatNumberVal = 1

                    if ($InputString -eq $OutputString) {
                        return $true            
                        break
                    } #if
                    
                }
                Default { 
                    Write-Error "ERROR"
                    exit
                }
            }

        } #while

        if($PSBoundParameters.ContainsKey('RepeatNumber')) {
            
            return $RepeatNumberVal

        } 
        elseif (($InputString -eq "") -and ($InputString -eq "")) {
            
            return $true

        }
        else {
            
            return $false

        }

    } #process
    END {

    } #end

} #function
Get-NecklaceMatch -InputString "" -OutputString ""