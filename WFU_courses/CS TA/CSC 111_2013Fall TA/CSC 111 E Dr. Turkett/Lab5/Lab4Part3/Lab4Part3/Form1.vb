Public Class Form1

    Private Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim ChecksCleared As Integer
        Dim MonthlyCharge As Double

        ChecksCleared = CInt(txtChecksCleared.Text)

        If ChecksCleared < 20 Then
            MonthlyCharge = 10 + (ChecksCleared * 0.1)
        ElseIf ChecksCleared <= 39 Then
            MonthlyCharge = 10 + (ChecksCleared * 0.08)
        ElseIf ChecksCleared <= 59 Then
            MonthlyCharge = 10 + (ChecksCleared * 0.06)
        Else : MonthlyCharge = 10 + (ChecksCleared * 0.04)

        End If
        lblMonthlyChargeOutput.Text = CStr(MonthlyCharge)
    End Sub
End Class
