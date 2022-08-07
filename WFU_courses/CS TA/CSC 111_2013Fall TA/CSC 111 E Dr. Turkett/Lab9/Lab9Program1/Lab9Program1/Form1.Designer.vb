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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.lblMeanOutput = New System.Windows.Forms.Label()
        Me.lblMaxOutput = New System.Windows.Forms.Label()
        Me.btnAnalyze = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 22)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(110, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Mean Shares Owned:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(19, 57)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(103, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Max Shares Owned:"
        '
        'lblMeanOutput
        '
        Me.lblMeanOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblMeanOutput.Location = New System.Drawing.Point(130, 12)
        Me.lblMeanOutput.Name = "lblMeanOutput"
        Me.lblMeanOutput.Size = New System.Drawing.Size(142, 23)
        Me.lblMeanOutput.TabIndex = 2
        '
        'lblMaxOutput
        '
        Me.lblMaxOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblMaxOutput.Location = New System.Drawing.Point(130, 47)
        Me.lblMaxOutput.Name = "lblMaxOutput"
        Me.lblMaxOutput.Size = New System.Drawing.Size(142, 23)
        Me.lblMaxOutput.TabIndex = 3
        '
        'btnAnalyze
        '
        Me.btnAnalyze.Location = New System.Drawing.Point(15, 92)
        Me.btnAnalyze.Name = "btnAnalyze"
        Me.btnAnalyze.Size = New System.Drawing.Size(257, 23)
        Me.btnAnalyze.TabIndex = 4
        Me.btnAnalyze.Text = "Analyze Share Distribution"
        Me.btnAnalyze.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 135)
        Me.Controls.Add(Me.btnAnalyze)
        Me.Controls.Add(Me.lblMaxOutput)
        Me.Controls.Add(Me.lblMeanOutput)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents lblMeanOutput As System.Windows.Forms.Label
    Friend WithEvents lblMaxOutput As System.Windows.Forms.Label
    Friend WithEvents btnAnalyze As System.Windows.Forms.Button

End Class
