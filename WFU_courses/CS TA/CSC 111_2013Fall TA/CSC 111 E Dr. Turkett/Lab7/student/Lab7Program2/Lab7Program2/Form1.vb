Public Class Form1
    Function CompoundInterest(ByVal dblBalance As Double, ByVal dblInterestRate As Double, ByVal intUpperBound As Integer) As Double
        Dim dblOutputBalance As Double
        Dim intCounter As Integer

        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text)
        For intCounter = 1 To intUpperBound Step 1
            dblBalance = dblBalance * (1 + (dblInterestRate / intUpperBound))
        Next
        dblOutputBalance = dblBalance
        Return dblBalance
    End Function

    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click



        lblAnnualOutput.Text = CStr(CompoundInterest(CDbl(txtBalanceInput.Text), CDbl(txtInterestInput.Text), 1))

        lblMonthlyOutput.Text = CStr(CompoundInterest(CDbl(txtBalanceInput.Text), CDbl(txtInterestInput.Text), 12))

        lblDailyOutput.Text = CStr(CompoundInterest(CDbl(txtBalanceInput.Text), CDbl(txtInterestInput.Text), 365))
    End Sub




End Class




