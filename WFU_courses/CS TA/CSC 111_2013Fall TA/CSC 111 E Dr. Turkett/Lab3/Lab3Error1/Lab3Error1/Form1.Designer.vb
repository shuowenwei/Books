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
        Me.lblLoanAmount = New System.Windows.Forms.Label()
        Me.lblInterestRate = New System.Windows.Forms.Label()
        Me.lblPaymentPeriod = New System.Windows.Forms.Label()
        Me.btnCalculate = New System.Windows.Forms.Button()
        Me.lblPayment = New System.Windows.Forms.Label()
        Me.txtLoanAmount = New System.Windows.Forms.TextBox()
        Me.txtInterestRate = New System.Windows.Forms.TextBox()
        Me.txtPaymentPeriod = New System.Windows.Forms.TextBox()
        Me.lblMonthlyPayment = New System.Windows.Forms.Label()
        Me.lblTotal = New System.Windows.Forms.Label()
        Me.lblTotalPayment = New System.Windows.Forms.Label()
        Me.lblInterest = New System.Windows.Forms.Label()
        Me.lblInterestPaid = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'lblLoanAmount
        '
        Me.lblLoanAmount.AutoSize = True
        Me.lblLoanAmount.Location = New System.Drawing.Point(22, 22)
        Me.lblLoanAmount.Name = "lblLoanAmount"
        Me.lblLoanAmount.Size = New System.Drawing.Size(85, 13)
        Me.lblLoanAmount.TabIndex = 0
        Me.lblLoanAmount.Text = "Loan Amount ($)"
        '
        'lblInterestRate
        '
        Me.lblInterestRate.AutoSize = True
        Me.lblInterestRate.Location = New System.Drawing.Point(22, 84)
        Me.lblInterestRate.Name = "lblInterestRate"
        Me.lblInterestRate.Size = New System.Drawing.Size(121, 13)
        Me.lblInterestRate.TabIndex = 1
        Me.lblInterestRate.Text = "Annual Interest Rate (%)"
        '
        'lblPaymentPeriod
        '
        Me.lblPaymentPeriod.AutoSize = True
        Me.lblPaymentPeriod.Location = New System.Drawing.Point(22, 144)
        Me.lblPaymentPeriod.Name = "lblPaymentPeriod"
        Me.lblPaymentPeriod.Size = New System.Drawing.Size(125, 13)
        Me.lblPaymentPeriod.TabIndex = 2
        Me.lblPaymentPeriod.Text = "Payment Period (Months)"
        '
        'btnCalculate
        '
        Me.btnCalculate.Location = New System.Drawing.Point(25, 209)
        Me.btnCalculate.Name = "btnCalculate"
        Me.btnCalculate.Size = New System.Drawing.Size(231, 40)
        Me.btnCalculate.TabIndex = 3
        Me.btnCalculate.Text = "Calculate Payment Info"
        Me.btnCalculate.UseVisualStyleBackColor = True
        '
        'lblPayment
        '
        Me.lblPayment.AutoSize = True
        Me.lblPayment.Location = New System.Drawing.Point(169, 22)
        Me.lblPayment.Name = "lblPayment"
        Me.lblPayment.Size = New System.Drawing.Size(88, 13)
        Me.lblPayment.TabIndex = 4
        Me.lblPayment.Text = "Monthly Payment"
        '
        'txtLoanAmount
        '
        Me.txtLoanAmount.Location = New System.Drawing.Point(25, 45)
        Me.txtLoanAmount.Name = "txtLoanAmount"
        Me.txtLoanAmount.Size = New System.Drawing.Size(100, 20)
        Me.txtLoanAmount.TabIndex = 5
        '
        'txtInterestRate
        '
        Me.txtInterestRate.Location = New System.Drawing.Point(25, 113)
        Me.txtInterestRate.Name = "txtInterestRate"
        Me.txtInterestRate.Size = New System.Drawing.Size(100, 20)
        Me.txtInterestRate.TabIndex = 6
        '
        'txtPaymentPeriod
        '
        Me.txtPaymentPeriod.Location = New System.Drawing.Point(25, 175)
        Me.txtPaymentPeriod.Name = "txtPaymentPeriod"
        Me.txtPaymentPeriod.Size = New System.Drawing.Size(100, 20)
        Me.txtPaymentPeriod.TabIndex = 7
        '
        'lblMonthlyPayment
        '
        Me.lblMonthlyPayment.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblMonthlyPayment.Location = New System.Drawing.Point(157, 42)
        Me.lblMonthlyPayment.Name = "lblMonthlyPayment"
        Me.lblMonthlyPayment.Size = New System.Drawing.Size(115, 23)
        Me.lblMonthlyPayment.TabIndex = 8
        '
        'lblTotal
        '
        Me.lblTotal.AutoSize = True
        Me.lblTotal.Location = New System.Drawing.Point(180, 84)
        Me.lblTotal.Name = "lblTotal"
        Me.lblTotal.Size = New System.Drawing.Size(55, 13)
        Me.lblTotal.TabIndex = 9
        Me.lblTotal.Text = "Total Paid"
        '
        'lblTotalPayment
        '
        Me.lblTotalPayment.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblTotalPayment.Location = New System.Drawing.Point(157, 110)
        Me.lblTotalPayment.Name = "lblTotalPayment"
        Me.lblTotalPayment.Size = New System.Drawing.Size(115, 23)
        Me.lblTotalPayment.TabIndex = 10
        '
        'lblInterest
        '
        Me.lblInterest.AutoSize = True
        Me.lblInterest.Location = New System.Drawing.Point(180, 144)
        Me.lblInterest.Name = "lblInterest"
        Me.lblInterest.Size = New System.Drawing.Size(66, 13)
        Me.lblInterest.TabIndex = 11
        Me.lblInterest.Text = "Interest Paid"
        '
        'lblInterestPaid
        '
        Me.lblInterestPaid.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblInterestPaid.Location = New System.Drawing.Point(157, 172)
        Me.lblInterestPaid.Name = "lblInterestPaid"
        Me.lblInterestPaid.Size = New System.Drawing.Size(115, 23)
        Me.lblInterestPaid.TabIndex = 12
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 261)
        Me.Controls.Add(Me.lblInterestPaid)
        Me.Controls.Add(Me.lblInterest)
        Me.Controls.Add(Me.lblTotalPayment)
        Me.Controls.Add(Me.lblTotal)
        Me.Controls.Add(Me.lblMonthlyPayment)
        Me.Controls.Add(Me.txtPaymentPeriod)
        Me.Controls.Add(Me.txtInterestRate)
        Me.Controls.Add(Me.txtLoanAmount)
        Me.Controls.Add(Me.lblPayment)
        Me.Controls.Add(Me.btnCalculate)
        Me.Controls.Add(Me.lblPaymentPeriod)
        Me.Controls.Add(Me.lblInterestRate)
        Me.Controls.Add(Me.lblLoanAmount)
        Me.Name = "Form1"
        Me.Text = "Payment Calculator"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblLoanAmount As System.Windows.Forms.Label
    Friend WithEvents lblInterestRate As System.Windows.Forms.Label
    Friend WithEvents lblPaymentPeriod As System.Windows.Forms.Label
    Friend WithEvents btnCalculate As System.Windows.Forms.Button
    Friend WithEvents lblPayment As System.Windows.Forms.Label
    Friend WithEvents txtLoanAmount As System.Windows.Forms.TextBox
    Friend WithEvents txtInterestRate As System.Windows.Forms.TextBox
    Friend WithEvents txtPaymentPeriod As System.Windows.Forms.TextBox
    Friend WithEvents lblMonthlyPayment As System.Windows.Forms.Label
    Friend WithEvents lblTotal As System.Windows.Forms.Label
    Friend WithEvents lblTotalPayment As System.Windows.Forms.Label
    Friend WithEvents lblInterest As System.Windows.Forms.Label
    Friend WithEvents lblInterestPaid As System.Windows.Forms.Label

End Class
