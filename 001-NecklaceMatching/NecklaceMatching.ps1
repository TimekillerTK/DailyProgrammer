# Challenge: https://www.reddit.com/r/dailyprogrammer/comments/ffxabb/20200309_challenge_383_easy_necklace_matching/
function Get-NecklaceMatch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string]
        $inputstring,

        [Parameter()]
        [AllowEmptyString()]
        [string]
        $outputstring,

        [Parameter()]
        [switch]
        $RepeatNumber
    )
    BEGIN {

        #$inputstring = "x"
        $RepeatNumberVal = 0

    } #begin
    PROCESS {
        # Should count how many iterations it has at the beginning
        # Move last character to front
        # Repeat until string is equal to input string (returning $false) while checking each result for whether it matches outputstring.
        # If it does, break the loop and return $true
        
        
        # String of n letters = $inputstring.count
        # Move a letter 1 time, check if $newstring matches $inputstring
        # If yes, $count + 1
        # Once completed, spit out the $count
        function RepeatNumber {
            if ($newstring -eq $inputstring) {
                $RepeatNumberVal++
            }
        }

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
                $arraywithoutchar = $array[0..($array.Count - 2)]
    
                # moves $character to the front of the array
                $tmp = , $character + $arraywithoutchar
    
                # joins all values in array to a string
                $newstring = -join $tmp
    
                # RepeatNumber function
                if($PSBoundParameters.ContainsKey('RepeatNumber')) {
                    RepeatNumber
                }
                

                # Checks if $newstring equals $outputstring
                if ($newstring -eq $outputstring) {
                    return $true
                    if ($PSBoundParameters.ContainsKey('RepeatNumber')) {
                        return $RepeatNumberVal
                    }
            
                    exit
                } #if
            } #if
            elseif ($inputstring.Length -le 1) {

                if ($inputstring -eq $outputstring) {
                    return $true
                    if ($PSBoundParameters.ContainsKey('RepeatNumber')) {
                        return $RepeatNumberVal
                    }
            
                    exit
                } #if
                
            } #elseif

        } #while

        if ($PSBoundParameters.ContainsKey('RepeatNumber')) {
            return $RepeatNumberVal
        }

        return $false
        
    } #process
    END {

    } #end

} #function


Get-NecklaceMatch -inputstring abcabc -RepeatNumber