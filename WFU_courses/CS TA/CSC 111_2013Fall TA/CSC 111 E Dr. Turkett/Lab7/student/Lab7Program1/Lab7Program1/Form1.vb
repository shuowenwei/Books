Public Class Form1

    Sub Annually()
        Dim dblInterestRate As Double
        Dim dblBalance As Double
        Dim dblOutputBalance As Double
        dblInterestRate = CDbl(txtInterestInput.Text)
        dblBalance = CDbl(txtBalanceInput.Text) ' in each segment, retrieve the original balance from GUI
        dblOutputBalance = dblBalance * (1 + dblInterestRate) ' do the math
        lblAnnualOutput.Text = CDbl(dblOutputBalance) ' update GUI

    End Sub

    Sub Daily()
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

    Sub Monthly()
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

        dblBalance = CDbl(txtBalanceInput.Text)

    End Sub
    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click
        Annually()
        Daily()
        Monthly()
    End Sub
End Class
