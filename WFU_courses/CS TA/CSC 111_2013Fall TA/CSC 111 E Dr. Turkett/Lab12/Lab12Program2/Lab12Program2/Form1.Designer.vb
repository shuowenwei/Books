<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.btnRun = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lblSevenOutput = New System.Windows.Forms.Label()
        Me.lblTwelveOutput = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'btnRun
        '
        Me.btnRun.Location = New System.Drawing.Point(13, 13)
        Me.btnRun.Name = "btnRun"
        Me.btnRun.Size = New System.Drawing.Size(259, 23)
        Me.btnRun.TabIndex = 0
        Me.btnRun.Text = "Run Simulation"
        Me.btnRun.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 48)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(109, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Number of 7s Rolled: "
        '
        'lblSevenOutput
        '
        Me.lblSevenOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblSevenOutput.Location = New System.Drawing.Point(15, 65)
        Me.lblSevenOutput.Name = "lblSevenOutput"
        Me.lblSevenOutput.Size = New System.Drawing.Size(257, 23)
        Me.lblSevenOutput.TabIndex = 2
        '
        'lblTwelveOutput
        '
        Me.lblTwelveOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblTwelveOutput.Location = New System.Drawing.Point(15, 127)
        Me.lblTwelveOutput.Name = "lblTwelveOutput"
        Me.lblTwelveOutput.Size = New System.Drawing.Size(257, 23)
        Me.lblTwelveOutput.TabIndex = 4
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 110)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(115, 13)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "Number of 12s Rolled: "
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 160)
        Me.Controls.Add(Me.lblTwelveOutput)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.lblSevenOutput)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnRun)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnRun As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents lblSevenOutput As System.Windows.Forms.Label
    Friend WithEvents lblTwelveOutput As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label

End Class
