function Get-MorseCode {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $String
    )
    BEGIN {

        # Setting the alphabet and morsealphabet variables
        $LowerAlphabet = 65..90 | ForEach-Object { [char]$_ }
        $UpperAlphabet = 97..122 | ForEach-Object { [char]$_ }
        $MorseAlphabet = ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..".split(" ")
             
        # Creating an object with combined items
        $CombinedAlphabet = for ($i=0; $i -lt $LowerAlphabet.Count;$i++) {
            [PSCustomObject]@{
                LowerLetter = $LowerAlphabet[$i]
                UpperLetter = $UpperAlphabet[$i]
                MorseLetter = $MorseAlphabet[$i]
            }
        }
        
    }
    PROCESS {

        #$String = "Blabla"

        # First step will be to take the string and convert it into an array of chars
        # Variable needs to change here, because $String is typed as a [string] in the parameters
        $Temp = $String.ToCharArray()

        # The chars need to be converted to strings otherwise the next step will fail
        $Temp = $Temp | ForEach-Object {
            [string]$_
        }

        # Next, we'll need to change each of these chars to their matching morsecode char
        for ($i=0;$i -lt $Temp.Count; $i++) {
            $Temp[$i] = ($CombinedAlphabet | Where-Object {$_.LowerLetter -eq $Temp[$i]}).MorseLetter
        }

        # Finally, we'll need to put all this together into an output string
        $Temp = $Temp -join ""
        
    }
    END {

        $Temp

    }
}
