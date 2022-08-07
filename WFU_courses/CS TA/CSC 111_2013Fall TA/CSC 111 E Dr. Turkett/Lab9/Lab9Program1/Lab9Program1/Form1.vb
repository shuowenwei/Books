Imports System.IO




Public Class Form1
    Private Sub btnAnalyze_Click(sender As Object, e As EventArgs) Handles btnAnalyze.Click
        Dim inputFile As StreamReader
        inputFile = File.OpenText("sharedistribution.txt")

        Dim intShareholders As Integer
        intShareholders = CInt(inputFile.ReadLine())

        Dim arrayShares(intShareholders - 1) As Integer

        Dim intCount As Integer
        intCount = 0
        For intCount = 0 To (intShareholders - 1) Step 1
            arrayShares(intCount) = inputFile.ReadLine()
        Next

        inputFile.Close()

        Dim intMaxIndex As Integer
        Dim intMax As Integer
        For intMaxIndex = 0 To (intShareholders - 1) Step 1
            If arrayShares(intMaxIndex) > intMax Then
                intMax = (arrayShares(intMaxIndex))
            End If
        Next

        lblMaxOutput.Text = CStr(intMax)

        Dim intAverageIndex As Integer
        Dim dblAverage As Double
        Dim intTotal As Integer

        For intAverageIndex = 0 To (intShareholders - 1) Step 1
            intTotal = intTotal + arrayShares(intAverageIndex)
        Next

        dblAverage = intTotal / intShareholders

        lblMeanOutput.Text = CStr(dblAverage)

    End Sub
End Class
