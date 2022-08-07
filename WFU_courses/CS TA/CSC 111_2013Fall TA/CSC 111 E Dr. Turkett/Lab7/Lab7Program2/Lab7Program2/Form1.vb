Public Class Form1
    Function CompoundInterest(ByVal dblBalance As Double, ByVal dblInterestRate As Double, ByVal intUpper As Integer) As Double
        Dim intCounter As Integer
        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text)
        For intCounter = 1 To intUpper
            dblBalance = dblBalance * (1 + dblInterestRate / intUpper)
        Next
        Return dblBalance
    End Function

    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click
        Dim dblBalance As Double
        Dim intCounter As Integer
        Dim dblInterestRate As Double

        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text)

        lblAnnualOutput.Text = CStr(CompoundInterest(dblBalance, dblInterestRate, 1))
        lblMonthlyOutput.Text = CStr(CompoundInterest(dblBalance, dblInterestRate, 12))
        lblDailyOutput.Text = CStr(CompoundInterest(dblBalance, dblInterestRate, 365))
    End Sub
End Class
