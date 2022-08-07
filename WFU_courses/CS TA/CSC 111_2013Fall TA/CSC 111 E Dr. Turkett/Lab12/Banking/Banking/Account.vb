Public Class Account
    Private strID As String
    Private dblBalance As Double

    Public Function getID() As String
        Return strID
    End Function

    Public Sub setID(ByVal strIDArg As String)
        strID = strIDArg
    End Sub

    Public Function getBalance() As Double
        Return dblBalance
    End Function

    Public Sub setBalance(ByVal dblBalanceArg As Double)
        dblBalance = dblBalanceArg
    End Sub

    Public Sub handleTransaction(ByVal trnTransaction As Transaction)
        dblBalance = dblBalance + trnTransaction.getAmount()
    End Sub


End Class
