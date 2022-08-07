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
        Me.Label2 = New System.Windows.Forms.Label()
        Me.lblTotalOutput = New System.Windows.Forms.Label()
        Me.lblDayOutput = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'btnAnalyze
        '
        Me.btnAnalyze.Location = New System.Drawing.Point(13, 13)
        Me.btnAnalyze.Name = "btnAnalyze"
        Me.btnAnalyze.Size = New System.Drawing.Size(259, 23)
        Me.btnAnalyze.TabIndex = 0
        Me.btnAnalyze.Text = "Analyze Weekly Customers"
        Me.btnAnalyze.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(13, 52)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(86, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Total Customers:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(30, 94)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(66, 13)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Busiest Day:"
        '
        'lblTotalOutput
        '
        Me.lblTotalOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblTotalOutput.Location = New System.Drawing.Point(103, 51)
        Me.lblTotalOutput.Name = "lblTotalOutput"
        Me.lblTotalOutput.Size = New System.Drawing.Size(169, 23)
        Me.lblTotalOutput.TabIndex = 3
        '
        'lblDayOutput
        '
        Me.lblDayOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblDayOutput.Location = New System.Drawing.Point(103, 84)
        Me.lblDayOutput.Name = "lblDayOutput"
        Me.lblDayOutput.Size = New System.Drawing.Size(169, 23)
        Me.lblDayOutput.TabIndex = 4
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 127)
        Me.Controls.Add(Me.lblDayOutput)
        Me.Controls.Add(Me.lblTotalOutput)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnAnalyze)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnAnalyze As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents lblTotalOutput As System.Windows.Forms.Label
    Friend WithEvents lblDayOutput As System.Windows.Forms.Label

End Class
