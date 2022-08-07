Public Class Simulator
    Private counts(11) As Integer

    Public Sub New()
        Dim intCount As Integer
        For intCount = 0 To 10
            counts(intCount) = 0
        Next
    End Sub

    Public Function GetCountFor(ByVal intValue As Integer) As Integer
        Return counts(intValue - 2)
    End Function

    Public Sub IncrementCountFor(ByVal intValue As Integer)
        counts(intValue - 2) = counts(intValue - 2) + 1
    End Sub
End Class
