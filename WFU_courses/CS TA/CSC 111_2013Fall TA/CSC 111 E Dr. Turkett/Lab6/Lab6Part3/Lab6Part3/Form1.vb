Public Class Form1

    Dim randomNumberGenerator As New Random

    Private Function customerArrives() As Boolean
        ' This function implements a 25% probability of a new customer at a given timestep
        ' (Alternatively, a new customer arrives on average every 4 timesteps)
        If (randomNumberGenerator.NextDouble() < 0.25) Then
            Return True
        Else
            Return False
        End If
    End Function

    Private Sub btnSimulate_Click(sender As Object, e As EventArgs) Handles btnSimulate.Click

        ' Declare variables as needed, YOU MAY NEED MORE!
        Dim intTimeSteps As Integer
        Dim intNumberOfServers As Integer
        Dim intNumberWaiting As Integer
        Dim intNumberHelped As Integer

        ' Initialize variables as needed
        intTimeSteps = CInt(txtTimeInput.Text)
        intNumberOfServers = CInt(txtServersInput.Text)
        intNumberWaiting = 0
        intNumberHelped = 0

        ' Manage the loop over timesteps, and within that loop, manage the arrival and servicing of customers
        ' COMPLETE THIS AS PART 3 OF LAB

        ' Update the GUI appropriately
        lblWaitingOutput.Text = CStr(intNumberWaiting)
        lblServedOutput.Text = CStr(intNumberHelped)
    End Sub
End Class
