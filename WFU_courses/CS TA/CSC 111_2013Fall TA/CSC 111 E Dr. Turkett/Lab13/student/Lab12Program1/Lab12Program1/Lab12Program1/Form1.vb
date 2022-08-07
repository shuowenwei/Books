Imports System.IO
Public Class Form1

    Private Sub btnAnalyze_Click(sender As Object, e As EventArgs) Handles btnAnalyze.Click
        Dim intNumberOfSales As Integer
        Dim intCount As Integer
        Dim dblNetGain As Double
        Dim intPositiveGains As Double

        ' Open the file of stock information
        Dim stockInput As StreamReader
        stockInput = File.OpenText("stockSales.txt")

        ' Determine how many sales are represented in the file
        intNumberOfSales = CInt(stockInput.ReadLine())

        ' Create an array of the appropriate size to hold the stock sale information
        Dim stockArray(intNumberOfSales - 1) As StockSale

        ' Read in the stock information from the file 
        For intCount = 0 To intNumberOfSales - 1
            Dim sale As New StockSale
            sale.setStockName(stockInput.ReadLine())
            sale.setGain(CDbl(stockInput.ReadLine()))
            stockArray(intCount) = sale
        Next

        stockInput.Close()

        ' Go through the array of sales and compute (a) the total gain and (b) how many were positive gain sales
        For intCount = 0 To intNumberOfSales - 1
            dblNetGain = dblNetGain + stockArray(intCount).getGain()
            If stockArray(intCount).positiveGain() = True Then
                intPositiveGains = intPositiveGains + 1
            End If
        Next

        ' Display outputs
        lblNetGainOutput.Text = CStr(dblNetGain)
        lblPositiveGainOutput.Text = CInt(intPositiveGains)
    End Sub
End Class
