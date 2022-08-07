Public Class Form1

    Private Function getPrice() As Double
        ' This function shows an input box to the user. If they enter a positive value and hit OK, that positive value entered is returned
        ' Otherwise, if the user enters a negative value or hits Cancel, a negative value is returned
        Dim strUserInput As String
        Dim dblReturnValue As Double

        strUserInput = InputBox("Enter item's price and press OK to store. Press Cancel or enter negative value to end entering transactions.", "Item Entry")
        If strUserInput = String.Empty Then
            dblReturnValue = -1.0
        Else
            dblReturnValue = CDbl(strUserInput)
        End If

        Return dblReturnValue
    End Function

    Private Sub btnEnterSales_Click(sender As Object, e As EventArgs) Handles btnEnterSales.Click
        ' Declare any needed variables
        Dim dblPrice As Double
        Dim dblTotalPrice As Double
        Dim intItemAmount As Integer

        ' Initialize any needed variables
        dblPrice = 0
        dblTotalPrice = 0
        dblPrice = getPrice()
        ' Loop: requesting user input of prices, updating variables, and updating the GUI as needed
        Do While dblPrice >= 0

            dblTotalPrice = dblPrice + dblTotalPrice
            intItemAmount = intItemAmount + 1
            lblItemsSoldOutput.Text = CStr(intItemAmount)
            lblTotalPriceOutput.Text = CStr(dblTotalPrice)
            dblPrice = getPrice()

        Loop
       
    End Sub
End Class
