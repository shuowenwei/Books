Public Class Form1

    Function compoundInterest(ByVal balanceInput As Double, ByVal rateInput As Double, ByVal monthsInput As Integer) As Double
        ' You, complete me!

        ' Base cases go here


        ' Recursive cases go here


    End Function

    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click
        ' Declare needed variables
        Dim dblBalance As Double
        Dim dblInterestRate As Double
        Dim intMonths As Integer
        Dim dblEndBalance As Double


        ' Obtain the inputs from the GUI
        dblBalance = CDbl(txtBalanceInput.Text)
        dblInterestRate = CDbl(txtInterestInput.Text)
        intMonths = CInt(txtMonthsInput.Text)

        ' Convert the user typed-in interest rate to an appropriate 0..1 vlaue (i.e 5% = 0.05)
        dblInterestRate = dblInterestRate / 100

        ' Call the compoundInterest function and retrieve the ending balance from the function when it completes
        dblEndBalance = compoundInterest(dblBalance, dblInterestRate, intMonths)

        ' Print the resulting balance to the screen
        lblOutput.Text = CStr(dblEndBalance)
    End Sub
End Class
