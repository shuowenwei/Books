Public Class Form1

    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click
        ' Declare variables needed
        Dim dblPurchasePrice As Double
        Dim dblSellPrice As Double
        Dim dblGain As Double
        Dim dblIncome As Double
        Dim dblTaxToPay As Double  ' Store your final tax value here so it is displayed to the screen

        ' Get input from GUI
        dblPurchasePrice = CDbl(txtPurchasePrice.Text)
        dblSellPrice = CDbl(txtSellPrice.Text)
        dblIncome = CDbl(txtIncome.Text)

        ' Complete instructions here
        dblGain = dblSellPrice - dblPurchasePrice
        If dblGain < 0 Then
            dblTaxToPay = 0
        Else If rad1Year.Checked = True AndAlso dblIncome < 200000 Then
                dblTaxToPay = dblGain * 0.28
            ElseIf rad1Year.Checked = True AndAlso dblIncome > 200000 Then
                dblTaxToPay = dblGain * 0.32
            ElseIf rad1Year.Checked = False AndAlso dblIncome < 200000 Then
                dblTaxToPay = dblGain * 0.15
            ElseIf rad1Year.Checked = False AndAlso dblIncome > 200000 Then
                dblTaxToPay = dblGain * 0.19

        End If

        ' Print output to GUI
        lblTaxOutput.Text = CStr(dblTaxToPay)
    End Sub
End Class
