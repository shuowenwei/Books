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
        Me.btnAnalyze = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lblNetGainOutput = New System.Windows.Forms.Label()
        Me.lblPositiveGainOutput = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'btnAnalyze
        '
        Me.btnAnalyze.Location = New System.Drawing.Point(13, 13)
        Me.btnAnalyze.Name = "btnAnalyze"
        Me.btnAnalyze.Size = New System.Drawing.Size(259, 23)
        Me.btnAnalyze.TabIndex = 0
        Me.btnAnalyze.Text = "Analyze Stock Sales"
        Me.btnAnalyze.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(13, 53)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(148, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Net Gain/Loss Over All Sales:"
        '
        'lblNetGainOutput
        '
        Me.lblNetGainOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblNetGainOutput.Location = New System.Drawing.Point(13, 75)
        Me.lblNetGainOutput.Name = "lblNetGainOutput"
        Me.lblNetGainOutput.Size = New System.Drawing.Size(256, 23)
        Me.lblNetGainOutput.TabIndex = 2
        '
        'lblPositiveGainOutput
        '
        Me.lblPositiveGainOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblPositiveGainOutput.Location = New System.Drawing.Point(13, 138)
        Me.lblPositiveGainOutput.Name = "lblPositiveGainOutput"
        Me.lblPositiveGainOutput.Size = New System.Drawing.Size(256, 23)
        Me.lblPositiveGainOutput.TabIndex = 4
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(13, 116)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(183, 13)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "Number Of Sales With Positive Gain: "
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 170)
        Me.Controls.Add(Me.lblPositiveGainOutput)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.lblNetGainOutput)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnAnalyze)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnAnalyze As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents lblNetGainOutput As System.Windows.Forms.Label
    Friend WithEvents lblPositiveGainOutput As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label

End Class
