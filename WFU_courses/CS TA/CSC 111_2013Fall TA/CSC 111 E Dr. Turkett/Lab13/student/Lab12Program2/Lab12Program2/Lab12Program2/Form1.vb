Public Class Form1
    Private Sub btnRun_Click(sender As Object, e As EventArgs) Handles btnRun.Click

        Dim Die1 As New Die
        Dim dblNumber As Double
        Dim Simulator1 As New Simulator
        Dim intX As Integer

        For intX = 0 To 10000
            dblNumber = Die1.Roll() + Die1.Roll()

            Simulator1.IncrementCountFor(dblNumber)
        Next


        lblSevenOutput.Text = CStr(Simulator1.GetCountFor(7))
        lblTwelveOutput.Text = CStr(Simulator1.GetCountFor(12))


    End Sub
End Class
