Public Class Form1
    Dim bankAccount As New Account

    Private Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim transaction As New Transaction

        transaction.setID(txtIDInput.Text)
        transaction.setAmount(CDbl(txtAmountInput.Text))

        bankAccount.handleTransaction(transaction)

        lblBalanceOutput.Text = CStr(bankAccount.getBalance())
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        bankAccount.setBalance(300.0)
        bankAccount.setID(1)
        lblBalanceOutput.Text = CStr(bankAccount.getBalance())
    End Sub
End Class
