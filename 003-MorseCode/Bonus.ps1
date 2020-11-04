# Morsecode bonus challenge: https://www.reddit.com/r/dailyprogrammer/comments/cmd1hb/20190805_challenge_380_easy_smooshed_morse_code_1/
<#
For these challenges, use the enable1 (list.txt) word list. It contains 172,823 words. If you encode them all, you would get a total of 2,499,157 dots and 1,565,081 dashes.

    1. The sequence -...-....-.--. is the code for four different words (needing, nervate, niding, tiling). Find the only sequence that's the code for 13 different words.

    2. autotomous encodes to .-..--------------..-..., which has 14 dashes in a row. Find the only word that has 15 dashes in a row.

    3. Call a word perfectly balanced if its code has the same number of dots as dashes. counterdemonstrations is one of two 21-letter words that's perfectly balanced. Find the other one.

    4. protectorate is 12 letters long and encodes to .--..-.----.-.-.----.-..--., which is a palindrome (i.e. the string is the same when reversed). Find the only 13-letter word that encodes to a palindrome.

    5. --.---.---.-- is one of five 13-character sequences that does not appear in the encoding of any word. Find the other four.

#>

Import-Module .\MorseCode.ps1 -Force

# $Bonus = Get-Content $PSScriptRoot\list.txt
# $Bonus | ForEach-Object -Parallel {
#     Get-MorseCode -String $_
# } | Out-Default

