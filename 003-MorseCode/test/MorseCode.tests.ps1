# https://www.reddit.com/r/dailyprogrammer/comments/cmd1hb/20190805_challenge_380_easy_smooshed_morse_code_1/

#region:Header
BeforeAll {
    . ($PScommandpath.Replace('.tests','')).Replace('\test','')
}
#endregion

Describe "MorseCode" {
    Context "Check Strings" {
        $testcases = @(
            @{ string = "sos"; code = "...---..."}
            @{ string = "daily"; code = "-...-...-..-.--"}
            @{ string = "programmer"; code = ".--..-.-----..-..-----..-."}
            @{ string = "bits"; code = "-.....-..."}
            @{ string = "three"; code = "-.....-..."}
        )
        It "<string> should be <code>" -TestCases $testcases {
            param($string,$code)
            Get-MorseCode -String $string | Should -Be $code
        }
    }

}