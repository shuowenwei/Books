Public Class Form1

    Private Sub btnAnalyze_Click(sender As Object, e As EventArgs) Handles btnAnalyze.Click
        ' Declare variables as needed
        Dim boolTarget As Boolean

        ' Check first set of conditions of interest
        If radFemale.Checked = True AndAlso radWFU.Checked = True OrElse radMale.Checked = True AndAlso CInt(txtAge.Text) < 20 Then
            boolTarget = True
        End If

        ' Set the label in the output appropriately
        If boolTarget = True Then
            lblTargetOutput.Text = "Yes"
        Else
            lblTargetOutput.Text = "No"
        End If
    End Sub

    Private Sub lblTargetOutput_Click(sender As Object, e As EventArgs) Handles lblTargetOutput.Click

    End Sub
End Class
