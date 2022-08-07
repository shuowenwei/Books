Public Class Die
    Private value As Integer
    Private randomNumberGenerator As Random

    Public Sub New()
        randomNumberGenerator = New Random
        value = 0
    End Sub

    Public Function Roll() As Integer
        Return randomNumberGenerator.Next(6) + 1
    End Function
End Class
