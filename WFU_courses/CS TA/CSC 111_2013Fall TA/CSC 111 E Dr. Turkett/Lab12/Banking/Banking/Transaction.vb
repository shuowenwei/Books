Public Class Transaction
    Private strID As String
    Private dblAmount As Double

    Public Function getID() As String
        Return strID
    End Function

    Public Sub setID(ByVal strIDArg As String)
        strID = strIDArg
    End Sub

    Public Function getAmount() As Double
        Return dblAmount
    End Function

    Public Sub setAmount(ByVal dblAmountArg As Double)
        dblAmount = dblAmountArg
    End Sub

    Public Function equalTo(ByVal otherTransaction As Transaction)
        If strID = otherTransaction.getID() AndAlso dblAmount = otherTransaction.getAmount() Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function notEqualTo(ByVal otherTransaction As Transaction)
        Return Not equalTo(otherTransaction)
    End Function

End Class
