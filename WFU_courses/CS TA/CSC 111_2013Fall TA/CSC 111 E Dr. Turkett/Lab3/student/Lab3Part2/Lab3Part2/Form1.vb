Public Class Form1

    Private Sub lblDividendPerShare_Click(sender As Object, e As EventArgs) Handles lblDividendPerShare.Click

    End Sub

    Private Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim DividendPerShare As Double
        Dim TotalShares As Double
        Dim DividentAmount As Double
        DividendPerShare = CDbl(txtDividendPerShare.Text)
        TotalShares = CDbl(txtTotalShares.Text)
        DividentAmount = DividendPerShare * TotalShares
        lblDividendOutput.Text = CStr(DividentAmount)

    End Sub
End Class
