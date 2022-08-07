Public Class Form1
    Sub AnnualCompound()
        Dim dblInterestRate As Double
        Dim dblBalance As Double
        Dim dblOutputBalance As Double
        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text)
        dblOutputBalance = dblBalance * (1 + dblInterestRate)
        lblAnnualOutput.Text = CDbl(dblOutputBalance)
    End Sub

    Sub MonthlyCompound()
        Dim dblInterestRate As Double
        Dim dblBalance As Double
        Dim dblOutputBalance As Double
        Dim intCounter As Integer
        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text)
        For intCounter = 1 To 12 Step 1
            dblBalance = dblBalance * (1 + (dblInterestRate / 12))
        Next
        dblOutputBalance = dblBalance
        lblMonthlyOutput.Text = CDbl(dblOutputBalance)
    End Sub

    Sub DailyCompound()
        Dim dblInterestRate As Double
        Dim dblBalance As Double
        Dim dblOutputBalance As Double
        Dim intCounter As Integer
        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text)
        For intCounter = 1 To 365 Step 1
            dblBalance = dblBalance * (1 + (dblInterestRate / 365))
        Next
        dblOutputBalance = dblBalance
        lblDailyOutput.Text = CDbl(dblOutputBalance)
    End Sub
    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click
        ' Declare variables as needed
        AnnualCompound()
        MonthlyCompound()
        DailyCompound()
    End Sub
End Class
