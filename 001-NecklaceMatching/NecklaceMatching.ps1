# Challenge: https://www.reddit.com/r/dailyprogrammer/comments/ffxabb/20200309_challenge_383_easy_necklace_matching/
function Get-NecklaceMatch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string]
        $inputstring,

        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string]
        $outputstring
    )
    BEGIN {

        #$inputstring = "x"

    }
    PROCESS {
        # Should count how many iterations it has at the beginning
        # Move last character to front
        # Repeat until string is equal to input string (returning $false) while checking each result for whether it matches outputstring.
        # If it does, break the loop and return $true
        
        $newstring = $inputstring

        While ($count -ne $inputstring.Length) {

            $count += 1
            #Write-Output "For $inputstring, value of `$newstring is: $newstring"
            
            # Converts strings into char array
            $array = $newstring.ToCharArray()
    
            if ($inputstring.Length -gt 1) {
            
                # marks the last object of the array
                $character = $array[-1]

                # Selects all objects except the last one
                # Array.length - 2 results in -1
                # check for null? Check for single char?
                $arraywithoutchar = $array[0..($array.Count - 2)]
    
                # moves $character to the front of the array
                $tmp = , $character + $arraywithoutchar
    
                # joins all values in array to a string
                $newstring = -join $tmp
    
                # Checks if $newstring equals $outputstring
                if ($newstring -eq $outputstring) {
                    return $true
                    exit
                }
            } elseif ($inputstring.Length -le 1) {

                if ($inputstring -eq $outputstring) {
                    return $true
                    exit
                }
                
            }

        }

        return $false
        
    }
    END {

    }

}