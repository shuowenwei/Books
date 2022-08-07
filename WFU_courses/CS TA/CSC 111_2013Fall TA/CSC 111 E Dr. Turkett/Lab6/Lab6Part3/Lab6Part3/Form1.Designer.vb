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
        Me.btnSimulate = New System.Windows.Forms.Button()
        Me.lblServersLabel = New System.Windows.Forms.Label()
        Me.txtServersInput = New System.Windows.Forms.TextBox()
        Me.lblWaitingLabel = New System.Windows.Forms.Label()
        Me.lblWaitingOutput = New System.Windows.Forms.Label()
        Me.lblServedLabel = New System.Windows.Forms.Label()
        Me.lblServedOutput = New System.Windows.Forms.Label()
        Me.lblTimeLabel = New System.Windows.Forms.Label()
        Me.txtTimeInput = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'btnSimulate
        '
        Me.btnSimulate.Location = New System.Drawing.Point(24, 217)
        Me.btnSimulate.Name = "btnSimulate"
        Me.btnSimulate.Size = New System.Drawing.Size(236, 23)
        Me.btnSimulate.TabIndex = 0
        Me.btnSimulate.Text = "Run Simulation"
        Me.btnSimulate.UseVisualStyleBackColor = True
        '
        'lblServersLabel
        '
        Me.lblServersLabel.AutoSize = True
        Me.lblServersLabel.Location = New System.Drawing.Point(24, 53)
        Me.lblServersLabel.Name = "lblServersLabel"
        Me.lblServersLabel.Size = New System.Drawing.Size(98, 13)
        Me.lblServersLabel.TabIndex = 1
        Me.lblServersLabel.Text = "Number of Servers:"
        '
        'txtServersInput
        '
        Me.txtServersInput.Location = New System.Drawing.Point(24, 69)
        Me.txtServersInput.Name = "txtServersInput"
        Me.txtServersInput.Size = New System.Drawing.Size(233, 20)
        Me.txtServersInput.TabIndex = 2
        '
        'lblWaitingLabel
        '
        Me.lblWaitingLabel.AutoSize = True
        Me.lblWaitingLabel.Location = New System.Drawing.Point(24, 102)
        Me.lblWaitingLabel.Name = "lblWaitingLabel"
        Me.lblWaitingLabel.Size = New System.Drawing.Size(150, 13)
        Me.lblWaitingLabel.TabIndex = 3
        Me.lblWaitingLabel.Text = "Number of Customers Waiting:"
        '
        'lblWaitingOutput
        '
        Me.lblWaitingOutput.AutoSize = True
        Me.lblWaitingOutput.Location = New System.Drawing.Point(27, 128)
        Me.lblWaitingOutput.Name = "lblWaitingOutput"
        Me.lblWaitingOutput.Size = New System.Drawing.Size(13, 13)
        Me.lblWaitingOutput.TabIndex = 4
        Me.lblWaitingOutput.Text = "0"
        '
        'lblServedLabel
        '
        Me.lblServedLabel.AutoSize = True
        Me.lblServedLabel.Location = New System.Drawing.Point(24, 155)
        Me.lblServedLabel.Name = "lblServedLabel"
        Me.lblServedLabel.Size = New System.Drawing.Size(148, 13)
        Me.lblServedLabel.TabIndex = 5
        Me.lblServedLabel.Text = "Number of Customers Served:"
        '
        'lblServedOutput
        '
        Me.lblServedOutput.AutoSize = True
        Me.lblServedOutput.Location = New System.Drawing.Point(27, 184)
        Me.lblServedOutput.Name = "lblServedOutput"
        Me.lblServedOutput.Size = New System.Drawing.Size(13, 13)
        Me.lblServedOutput.TabIndex = 6
        Me.lblServedOutput.Text = "0"
        '
        'lblTimeLabel
        '
        Me.lblTimeLabel.AutoSize = True
        Me.lblTimeLabel.Location = New System.Drawing.Point(27, 9)
        Me.lblTimeLabel.Name = "lblTimeLabel"
        Me.lblTimeLabel.Size = New System.Drawing.Size(169, 13)
        Me.lblTimeLabel.TabIndex = 7
        Me.lblTimeLabel.Text = "Number of Timesteps To Simulate:"
        '
        'txtTimeInput
        '
        Me.txtTimeInput.Location = New System.Drawing.Point(24, 25)
        Me.txtTimeInput.Name = "txtTimeInput"
        Me.txtTimeInput.Size = New System.Drawing.Size(233, 20)
        Me.txtTimeInput.TabIndex = 8
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 270)
        Me.Controls.Add(Me.txtTimeInput)
        Me.Controls.Add(Me.lblTimeLabel)
        Me.Controls.Add(Me.lblServedOutput)
        Me.Controls.Add(Me.lblServedLabel)
        Me.Controls.Add(Me.lblWaitingOutput)
        Me.Controls.Add(Me.lblWaitingLabel)
        Me.Controls.Add(Me.txtServersInput)
        Me.Controls.Add(Me.lblServersLabel)
        Me.Controls.Add(Me.btnSimulate)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnSimulate As System.Windows.Forms.Button
    Friend WithEvents lblServersLabel As System.Windows.Forms.Label
    Friend WithEvents txtServersInput As System.Windows.Forms.TextBox
    Friend WithEvents lblWaitingLabel As System.Windows.Forms.Label
    Friend WithEvents lblWaitingOutput As System.Windows.Forms.Label
    Friend WithEvents lblServedLabel As System.Windows.Forms.Label
    Friend WithEvents lblServedOutput As System.Windows.Forms.Label
    Friend WithEvents lblTimeLabel As System.Windows.Forms.Label
    Friend WithEvents txtTimeInput As System.Windows.Forms.TextBox

End Class
