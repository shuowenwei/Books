Public Class Form1

    Private Sub btnCalculate_Click_1(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim p As Double
        Dim d As Double
        Dim n As Double

        ' read the inpus from the text field 
        d = CDbl(txtDividendPerShare.Text)
        n = CDbl(txtTotalShares.Text)

        ' compute the total payments 
        p = d * n

        'output computed values into output lables 
        lblDividendOutput.Text = CStr(p)
    End Sub
End Class
