Public Class Form1

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnHi_Click(sender As Object, e As EventArgs) Handles btnHi.Click
        lblGreeting.Text = "Hi " & txtUser.Text
    End Sub

    Private Sub btnHiBye_Click(sender As Object, e As EventArgs) Handles btnHiBye.Click
        lblGreeting.Text = "Bye " & txtUser.Text
    End Sub

    Private Sub btnGoodNight_Click(sender As Object, e As EventArgs) Handles btnGoodNight.Click
        lblGreeting.Text = "Good Night " & txtUser.Text
    End Sub

    Private Sub txtUser_TextChanged(sender As Object, e As EventArgs) Handles txtUser.TextChanged
        lblGreeting.Text = "User is typing: " & txtUser.Text

    End Sub
End Class
