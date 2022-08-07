Imports System.IO

Public Class Form1

    Private Sub btnLoad_Click(sender As Object, e As EventArgs) Handles btnLoad.Click
        Dim intMatches As Integer
        intMatches = 0

        Dim inputFile As StreamReader
        inputFile = File.OpenText("clientdatabase.txt")

        Dim intClients As Integer
        intClients = CInt(inputFile.ReadLine())

        Dim arrayClients(intClients - 1) As String
        Dim intCount As Integer
        For intCount = 0 To (intClients - 1) Step 1
            arrayClients(intCount) = inputFile.ReadLine()
        Next

        inputFile.Close()

        inputFile = File.OpenText("contacts.txt")

        Dim intContacts As Integer
        intContacts = CInt(inputFile.ReadLine())

        Dim strContact As String

        Do Until inputFile.EndOfStream = True
            strContact = inputFile.ReadLine()
            For intCount = 0 To (intClients - 1) Step 1
                If strContact = arrayClients(intCount) Then
                    intMatches = intMatches + 1
                End If
            Next
        Loop

        inputFile.Close()

        lblMatchOutput.Text = CStr(intMatches)
    End Sub
End Class
