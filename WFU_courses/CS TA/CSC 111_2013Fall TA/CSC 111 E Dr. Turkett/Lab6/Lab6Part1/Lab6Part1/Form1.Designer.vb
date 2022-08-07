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
        Me.lblOpeningBalance = New System.Windows.Forms.Label()
        Me.txtBalance = New System.Windows.Forms.TextBox()
        Me.lblInterestRate = New System.Windows.Forms.Label()
        Me.txtInterestRate = New System.Windows.Forms.TextBox()
        Me.lblBalanceLabel = New System.Windows.Forms.Label()
        Me.lblBalanceOutput = New System.Windows.Forms.Label()
        Me.btnDaily = New System.Windows.Forms.Button()
        Me.btnMonthly = New System.Windows.Forms.Button()
        Me.btnAnnual = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblOpeningBalance
        '
        Me.lblOpeningBalance.AutoSize = True
        Me.lblOpeningBalance.Location = New System.Drawing.Point(13, 22)
        Me.lblOpeningBalance.Name = "lblOpeningBalance"
        Me.lblOpeningBalance.Size = New System.Drawing.Size(92, 13)
        Me.lblOpeningBalance.TabIndex = 0
        Me.lblOpeningBalance.Text = "Opening Balance:"
        '
        'txtBalance
        '
        Me.txtBalance.Location = New System.Drawing.Point(123, 19)
        Me.txtBalance.Name = "txtBalance"
        Me.txtBalance.Size = New System.Drawing.Size(239, 20)
        Me.txtBalance.TabIndex = 1
        Me.txtBalance.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'lblInterestRate
        '
        Me.lblInterestRate.AutoSize = True
        Me.lblInterestRate.Location = New System.Drawing.Point(13, 48)
        Me.lblInterestRate.Name = "lblInterestRate"
        Me.lblInterestRate.Size = New System.Drawing.Size(74, 13)
        Me.lblInterestRate.TabIndex = 2
        Me.lblInterestRate.Text = "Interest Rate: "
        '
        'txtInterestRate
        '
        Me.txtInterestRate.Location = New System.Drawing.Point(123, 45)
        Me.txtInterestRate.Name = "txtInterestRate"
        Me.txtInterestRate.Size = New System.Drawing.Size(239, 20)
        Me.txtInterestRate.TabIndex = 3
        Me.txtInterestRate.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'lblBalanceLabel
        '
        Me.lblBalanceLabel.AutoSize = True
        Me.lblBalanceLabel.Location = New System.Drawing.Point(13, 75)
        Me.lblBalanceLabel.Name = "lblBalanceLabel"
        Me.lblBalanceLabel.Size = New System.Drawing.Size(108, 13)
        Me.lblBalanceLabel.TabIndex = 4
        Me.lblBalanceLabel.Text = "Balance After 1 Year:"
        '
        'lblBalanceOutput
        '
        Me.lblBalanceOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblBalanceOutput.Location = New System.Drawing.Point(123, 74)
        Me.lblBalanceOutput.Name = "lblBalanceOutput"
        Me.lblBalanceOutput.Size = New System.Drawing.Size(239, 23)
        Me.lblBalanceOutput.TabIndex = 5
        Me.lblBalanceOutput.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'btnDaily
        '
        Me.btnDaily.Location = New System.Drawing.Point(12, 122)
        Me.btnDaily.Name = "btnDaily"
        Me.btnDaily.Size = New System.Drawing.Size(89, 42)
        Me.btnDaily.TabIndex = 6
        Me.btnDaily.Text = "Daily Compounding"
        Me.btnDaily.UseVisualStyleBackColor = True
        '
        'btnMonthly
        '
        Me.btnMonthly.Location = New System.Drawing.Point(144, 122)
        Me.btnMonthly.Name = "btnMonthly"
        Me.btnMonthly.Size = New System.Drawing.Size(89, 42)
        Me.btnMonthly.TabIndex = 7
        Me.btnMonthly.Text = "Monthly Compounding"
        Me.btnMonthly.UseVisualStyleBackColor = True
        '
        'btnAnnual
        '
        Me.btnAnnual.Location = New System.Drawing.Point(273, 122)
        Me.btnAnnual.Name = "btnAnnual"
        Me.btnAnnual.Size = New System.Drawing.Size(89, 42)
        Me.btnAnnual.TabIndex = 8
        Me.btnAnnual.Text = "Annual Compounding"
        Me.btnAnnual.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(374, 176)
        Me.Controls.Add(Me.btnAnnual)
        Me.Controls.Add(Me.btnMonthly)
        Me.Controls.Add(Me.btnDaily)
        Me.Controls.Add(Me.lblBalanceOutput)
        Me.Controls.Add(Me.lblBalanceLabel)
        Me.Controls.Add(Me.txtInterestRate)
        Me.Controls.Add(Me.lblInterestRate)
        Me.Controls.Add(Me.txtBalance)
        Me.Controls.Add(Me.lblOpeningBalance)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblOpeningBalance As System.Windows.Forms.Label
    Friend WithEvents txtBalance As System.Windows.Forms.TextBox
    Friend WithEvents lblInterestRate As System.Windows.Forms.Label
    Friend WithEvents txtInterestRate As System.Windows.Forms.TextBox
    Friend WithEvents lblBalanceLabel As System.Windows.Forms.Label
    Friend WithEvents lblBalanceOutput As System.Windows.Forms.Label
    Friend WithEvents btnDaily As System.Windows.Forms.Button
    Friend WithEvents btnMonthly As System.Windows.Forms.Button
    Friend WithEvents btnAnnual As System.Windows.Forms.Button

End Class
