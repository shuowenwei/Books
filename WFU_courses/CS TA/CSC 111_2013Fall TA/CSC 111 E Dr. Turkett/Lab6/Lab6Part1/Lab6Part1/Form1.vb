Public Class Form1

    Private Sub btnAnnual_Click(sender As Object, e As EventArgs) Handles btnAnnual.Click
        'Declare variables
        Dim dblBalance As Double
        Dim dblInterestRate As Double
        Dim dblEndBalance As Double

        ' Get data from GUI as input
        dblBalance = CDbl(txtBalance.Text)
        dblInterestRate = CDbl(txtInterestRate.Text)

        ' Do computations
        ' FINISH THIS AS PART OF LAB, DOES NOT REQUIRE A LOOP!
        dblEndBalance = (dblInterestRate + 1) * dblBalance

        ' Display output
        lblBalanceOutput.Text = CStr(dblEndBalance)
    End Sub

    Private Sub btnMonthly_Click(sender As Object, e As EventArgs) Handles btnMonthly.Click
        'Declare variables
        Dim dblBalance As Double
        Dim dblInterestRate As Double
        Dim dblEndBalance As Double
        Dim intCount As Integer

        ' Get data from GUI as input
        dblBalance = CDbl(txtBalance.Text)
        dblInterestRate = CDbl(txtInterestRate.Text)

        ' Do computations
        ' FINISH THIS AS PART OF LAB, DOES REQUIRE A LOOP!
        For intCount = 1 To 12 Step 1
            dblBalance = dblBalance * (1 + (dblInterestRate / 12))
            dblEndBalance = dblBalance
        Next

        ' Display output
        lblBalanceOutput.Text = CStr(dblEndBalance)
    End Sub

    Private Sub btnDaily_Click(sender As Object, e As EventArgs) Handles btnDaily.Click
        'Declare variables
        Dim dblBalance As Double
        Dim dblInterestRate As Double
        Dim dblEndBalance As Double
        Dim intCount As Integer
        intCount = 1
        ' Get data from GUI as input
        dblBalance = CDbl(txtBalance.Text)
        dblInterestRate = CDbl(txtInterestRate.Text)

        ' Do computations
        ' FINISH THIS AS PART OF LAB, DOES REQUIRE A LOOP, USE A DIFFERENT KIND THAN YOU USED ABOVE
        Do While intCount <= 365
            dblBalance = dblBalance * (1 + (dblInterestRate / 365))
            intCount = intCount + 1
            dblEndBalance = dblBalance
        Loop

        ' Display output
        lblBalanceOutput.Text = CStr(dblEndBalance)
    End Sub
End Class
