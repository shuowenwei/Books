Public Class Form1

    Private Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim Quantity As Integer
        Dim Cost As Double
        Dim TotalSale As Double
        Dim Employee As Boolean

        Quantity = CInt(txtQuantity.Text)
        Cost = CDbl(txtCost.Text)
        TotalSale = Quantity * Cost

        If chkEmployee.Checked Then
            TotalSale = TotalSale * 0.8
        End If

        lblTotalSale.Text = CStr(TotalSale)
    End Sub
End Class
