Public Class StockSale
    Private strStockName As String
    Private dblGain As Double

    Public Sub New()
        dblGain = 0
        strStockName = ""
    End Sub
    Public Function getStockName() As String
        Return strStockName
    End Function

    Public Sub setStockName(ByVal strStockNameArg As String)
        strStockName = strStockNameArg
    End Sub

    Public Function getGain() As Double
        Return dblGain
    End Function

    Public Sub setGain(ByVal dblGainArg As Double)
        dblGain = dblGainArg
    End Sub

    Public Function positiveGain() As Double
        If dblGain > 0 Then
            Return True
        Else
            Return False
        End If
    End Function
End Class
