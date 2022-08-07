Public Class Lab1

    Private Sub btnExit_Click(sender As Object, e As EventArgs) Handles btnExit.Click
        ' Close the form and end the program
        Me.Close()
    End Sub

    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ' Clear (remove the text from) all of the input boxes
        txtFirstName.Clear()
        txtLastName.Clear()
        txtEmail.Clear()
        ' Provide focus to the first name field
        txtLastName.Focus()
    End Sub

    Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        ' Combine all the data from the other fields to show what will be added to the contacts list
        lblOutput.Text = txtLastName.Text + "," + txtFirstName.Text + " - " + txtEmail.Text
    End Sub
End Class
