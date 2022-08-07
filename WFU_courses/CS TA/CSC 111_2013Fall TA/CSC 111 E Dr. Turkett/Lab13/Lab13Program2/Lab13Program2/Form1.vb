Public Class Form1

    Function Combinations(ByVal N As Integer, ByVal K As Integer) As Integer
        ' Complete this function recursively

        ' Place base case(s) here


        ' Place recursive case(s) here

    End Function

    Private Sub btnCompute_Click(sender As Object, e As EventArgs) Handles btnCompute.Click
        ' Declare needed variables
        Dim intInputN As Integer
        Dim intInputK As Integer
        Dim intResult As Integer

        ' Read inputs from GUI into variables
        intInputN = CInt(txtNInput.Text)
        intInputK = CInt(txtKInput.Text)

        ' Call the Combinations function and capture the returned result into a variable
        intResult = Combinations(intInputN, intInputK)

        ' Print the result to the screen in an output label
        lblOutput.Text = CStr(intResult)
    End Sub
End Class
