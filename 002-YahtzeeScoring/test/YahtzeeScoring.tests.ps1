# Challenge: https://www.reddit.com/r/dailyprogrammer/comments/dv0231/20191111_challenge_381_easy_yahtzee_upper_section/

#region:Header
BeforeAll {
    . ($PScommandpath.Replace('.tests','')).Replace('\test','')
}
#endregion

Describe "Yahtzee Scoring Task" {
    Context "Main - Upper Scoring check - true" {

        $testcases = @(
            @{array = @(2, 3, 5, 5, 6); result = 10 }
            @{array = @(1, 1, 1, 1, 4); result = 4 }
            @{array = @(1, 1, 1, 3, 3); result = 6 }
            @{array = @(1, 2, 3, 4, 5); result = 5 }
            @{array = @(6, 6, 6, 6, 6); result = 30 }
        )
        It "Example array <array> should return <result>" -TestCases $testcases {
            param ($array, $result)
            Get-YahtzeeUpper -InputArray $array | Should -Be $result
        }
    }
}