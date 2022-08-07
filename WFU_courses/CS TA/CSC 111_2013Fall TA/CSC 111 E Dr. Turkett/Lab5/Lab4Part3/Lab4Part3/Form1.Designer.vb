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
        Me.lblChecksCleared = New System.Windows.Forms.Label()
        Me.lblMonthlyCharge = New System.Windows.Forms.Label()
        Me.lblMonthlyChargeOutput = New System.Windows.Forms.Label()
        Me.txtChecksCleared = New System.Windows.Forms.TextBox()
        Me.btnCalculate = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblChecksCleared
        '
        Me.lblChecksCleared.AutoSize = True
        Me.lblChecksCleared.Location = New System.Drawing.Point(25, 22)
        Me.lblChecksCleared.Name = "lblChecksCleared"
        Me.lblChecksCleared.Size = New System.Drawing.Size(85, 13)
        Me.lblChecksCleared.TabIndex = 0
        Me.lblChecksCleared.Text = "Checks Cleared:"
        '
        'lblMonthlyCharge
        '
        Me.lblMonthlyCharge.AutoSize = True
        Me.lblMonthlyCharge.Location = New System.Drawing.Point(199, 22)
        Me.lblMonthlyCharge.Name = "lblMonthlyCharge"
        Me.lblMonthlyCharge.Size = New System.Drawing.Size(84, 13)
        Me.lblMonthlyCharge.TabIndex = 1
        Me.lblMonthlyCharge.Text = "Monthly Charge:"
        '
        'lblMonthlyChargeOutput
        '
        Me.lblMonthlyChargeOutput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblMonthlyChargeOutput.Location = New System.Drawing.Point(289, 16)
        Me.lblMonthlyChargeOutput.Name = "lblMonthlyChargeOutput"
        Me.lblMonthlyChargeOutput.Size = New System.Drawing.Size(100, 23)
        Me.lblMonthlyChargeOutput.TabIndex = 2
        '
        'txtChecksCleared
        '
        Me.txtChecksCleared.Location = New System.Drawing.Point(116, 19)
        Me.txtChecksCleared.Name = "txtChecksCleared"
        Me.txtChecksCleared.Size = New System.Drawing.Size(50, 20)
        Me.txtChecksCleared.TabIndex = 3
        '
        'btnCalculate
        '
        Me.btnCalculate.Location = New System.Drawing.Point(28, 45)
        Me.btnCalculate.Name = "btnCalculate"
        Me.btnCalculate.Size = New System.Drawing.Size(361, 23)
        Me.btnCalculate.TabIndex = 4
        Me.btnCalculate.Text = "Calculate Monthly Charge"
        Me.btnCalculate.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(416, 76)
        Me.Controls.Add(Me.btnCalculate)
        Me.Controls.Add(Me.txtChecksCleared)
        Me.Controls.Add(Me.lblMonthlyChargeOutput)
        Me.Controls.Add(Me.lblMonthlyCharge)
        Me.Controls.Add(Me.lblChecksCleared)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblChecksCleared As System.Windows.Forms.Label
    Friend WithEvents lblMonthlyCharge As System.Windows.Forms.Label
    Friend WithEvents lblMonthlyChargeOutput As System.Windows.Forms.Label
    Friend WithEvents txtChecksCleared As System.Windows.Forms.TextBox
    Friend WithEvents btnCalculate As System.Windows.Forms.Button

End Class
