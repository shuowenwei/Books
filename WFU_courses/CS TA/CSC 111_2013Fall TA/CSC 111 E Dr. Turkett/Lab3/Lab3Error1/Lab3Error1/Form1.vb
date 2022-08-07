Public Class Form1

    Private Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim dblPrincipal As Double
        Dim dblRate As Double
        Dim dblMonthlyRate As Double
        Dim intMonths As Integer
        Dim dblTotalPaid As Double
        Dim dblInterestPaid As Double 
        Dim dblMonthlyPayment As Double

        ' read the inputs from the text fields
        dblPrincipal = CDbl(txtLoanAmount.Text)
        dblRate = CDbl(txtInterestRate.Text) / 100
        intMonths = CInt(txtPaymentPeriod.Text)

        ' compute the monthly payment given the inputs
        dblMonthlyRate = dblRate / 12
        dblMonthlyPayment = (dblPrincipal * dblMonthlyRate * ((1 + dblMonthlyRate) ^ intMonths)) / (((1 + dblMonthlyRate) ^ intMonths) - 1)

        ' compute the total payments (monthly payment * number of payments)
        dblTotalPaid = dblMonthlyPayment * intMonths ' dblMonthlyPayment ** intMonths

        ' compute the interest paid (total payments - original principal)
        dblInterestPaid = dblTotalPaid - dblPrincipal

        ' output computed values into output labels
        lblMonthlyPayment.Text = CStr(dblMonthlyPayment)
        lblTotalPayment.Text = CStr(dblTotalPaid)
        lblInterestPaid.Text = CStr(dblInterestPaid)

    End Sub

End Class
