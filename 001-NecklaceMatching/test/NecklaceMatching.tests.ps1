# Challenge: https://www.reddit.com/r/dailyprogrammer/comments/ffxabb/20200309_challenge_383_easy_necklace_matching/

#region:Header
BeforeAll {
    . ($PScommandpath.Replace('.tests','')).Replace('\test','')
}
#endregion

Describe "Necklace Matching" {
    Context "Main Task - returns true" {

        $testcases = @(
            @{stringinput = "nicole"; stringoutput = "icolen"}
            @{stringinput = "nicole"; stringoutput = "lenico"}
            @{stringinput = "aabaaaaabaab"; stringoutput = "aabaabaabaaa"}
            @{stringinput = "x"; stringoutput = "x"}
            @{stringinput = ""; stringoutput = ""}
        )

        It "Example <stringinput> should be <stringoutput>" -TestCases $testcases {
            param($stringinput, $stringoutput)
            Get-NecklaceMatch -InputString $stringinput -OutputString $stringoutput | Should -Be $true
        }
    }
    Context "Main Task - returns false" {

        $testcases = @(
                @{stringinput = "nicole"; stringoutput = "coneli"}
                @{stringinput = "abc"; stringoutput = "cba"}
                @{stringinput = "xxyyy"; stringoutput = "xxxyy"}
                @{stringinput = "xyxxz"; stringoutput = "xxyxz"}
                @{stringinput = "x"; stringoutput = "xx"}
                @{stringinput = "x"; stringoutput = ""}
            )

        It "Example <stringinput> should not be <stringoutput>" -TestCases $testcases {
            param($stringinput, $stringoutput)
            Get-NecklaceMatch -InputString $stringinput -OutputString $stringoutput | Should -Be $false
        }
    }
}