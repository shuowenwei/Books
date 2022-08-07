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
        Me.txtBalanceInput = New System.Windows.Forms.TextBox()
        Me.txtInterestInput = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.lblAnnualOutput = New System.Windows.Forms.Label()
        Me.lblMonthlyOutput = New System.Windows.Forms.Label()
        Me.lblDailyOutput = New System.Windows.Forms.Label()
        Me.btnCompute = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(112, 23)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(76, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Initial Balance:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(28, 56)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(160, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Advertised Annual Interest Rate:"
        '
        'txtBalanceInput
        '
        Me.txtBalanceInput.Location = New System.Drawing.Point(201, 23)
        Me.txtBalanceInput.Name = "txtBalanceInput"
        Me.txtBalanceInput.Size = New System.Drawing.Size(190, 20)
        Me.txtBalanceInput.TabIndex = 2
        '
        'txtInterestInput
        '
        Me.txtInterestInput.Location = New System.Drawing.Point(201, 56)
        Me.txtInterestInput.Name = "txtInterestInput"
        Me.txtInterestInput.Size = New System.Drawing.Size(190, 20)
        Me.txtInterestInput.TabIndex = 3
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(10, 101)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(178, 13)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "Balance After Annual Compounding:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(10, 139)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(182, 13)
        Me.Label4.TabIndex = 5
        Me.Label4.Text = "Balance After Monthly Compounding:"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(20, 182)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(168, 13)
        Me.Label5.TabIndex = 6
        Me.Label5.Text = "Balance After Daily Compounding:"
        '
        'lblAnnualOutput
        '
        Me.lblAnnualOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblAnnualOutput.Location = New System.Drawing.Point(201, 100)
        Me.lblAnnualOutput.Name = "lblAnnualOutput"
        Me.lblAnnualOutput.Size = New System.Drawing.Size(190, 23)
        Me.lblAnnualOutput.TabIndex = 7
        '
        'lblMonthlyOutput
        '
        Me.lblMonthlyOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblMonthlyOutput.Location = New System.Drawing.Point(198, 138)
        Me.lblMonthlyOutput.Name = "lblMonthlyOutput"
        Me.lblMonthlyOutput.Size = New System.Drawing.Size(190, 23)
        Me.lblMonthlyOutput.TabIndex = 8
        '
        'lblDailyOutput
        '
        Me.lblDailyOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblDailyOutput.Location = New System.Drawing.Point(198, 182)
        Me.lblDailyOutput.Name = "lblDailyOutput"
        Me.lblDailyOutput.Size = New System.Drawing.Size(190, 23)
        Me.lblDailyOutput.TabIndex = 9
        '
        'btnCompute
        '
        Me.btnCompute.Location = New System.Drawing.Point(23, 220)
        Me.btnCompute.Name = "btnCompute"
        Me.btnCompute.Size = New System.Drawing.Size(368, 23)
        Me.btnCompute.TabIndex = 10
        Me.btnCompute.Text = "Compute Balances"
        Me.btnCompute.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(413, 255)
        Me.Controls.Add(Me.btnCompute)
        Me.Controls.Add(Me.lblDailyOutput)
        Me.Controls.Add(Me.lblMonthlyOutput)
        Me.Controls.Add(Me.lblAnnualOutput)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.txtInterestInput)
        Me.Controls.Add(Me.txtBalanceInput)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtBalanceInput As System.Windows.Forms.TextBox
    Friend WithEvents txtInterestInput As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents lblAnnualOutput As System.Windows.Forms.Label
    Friend WithEvents lblMonthlyOutput As System.Windows.Forms.Label
    Friend WithEvents lblDailyOutput As System.Windows.Forms.Label
    Friend WithEvents btnCompute As System.Windows.Forms.Button

End Class
