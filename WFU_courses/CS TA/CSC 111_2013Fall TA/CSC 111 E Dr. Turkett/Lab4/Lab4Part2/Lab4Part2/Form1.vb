Public Class Form1

    Private Sub btnCalculateSales_Click(sender As Object, e As EventArgs) Handles btnCalculateSales.Click
        Dim PackageASold As Integer
        Dim PackageBSold As Integer
        Dim TotalSales As Double
        Dim TotalDiscount As Double

        PackageASold = CInt(txtPackageACopies.Text)
        PackageBSold = CInt(txtPackageBCopies.Text)
        TotalSales = (PackageASold * 100) + (PackageBSold * 200)

        If PackageASold > 20 Then
            TotalSales = TotalSales - (PackageASold * 30)
        End If

        If PackageBSold > 20 Then
            TotalSales = TotalSales - (PackageBSold * 60)
        End If

        TotalDiscount = (PackageASold * 100) + (PackageBSold * 200) - TotalSales

        lblTotalSales.Text = CStr(TotalSales)
        lblTotalDiscount.Text = CStr(TotalDiscount)
    End Sub
End Class
