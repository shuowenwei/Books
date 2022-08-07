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
        Me.lblDividendPerShare = New System.Windows.Forms.Label()
        Me.txtDividendPerShare = New System.Windows.Forms.TextBox()
        Me.lblTotalShares = New System.Windows.Forms.Label()
        Me.txtTotalShares = New System.Windows.Forms.TextBox()
        Me.lblDividentAmount = New System.Windows.Forms.Label()
        Me.lblDividendOutput = New System.Windows.Forms.Label()
        Me.btnCalculate = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblDividendPerShare
        '
        Me.lblDividendPerShare.AutoSize = True
        Me.lblDividendPerShare.Location = New System.Drawing.Point(34, 35)
        Me.lblDividendPerShare.Name = "lblDividendPerShare"
        Me.lblDividendPerShare.Size = New System.Drawing.Size(99, 13)
        Me.lblDividendPerShare.TabIndex = 0
        Me.lblDividendPerShare.Text = "Dividend Per Share"
        '
        'txtDividendPerShare
        '
        Me.txtDividendPerShare.Location = New System.Drawing.Point(149, 32)
        Me.txtDividendPerShare.Name = "txtDividendPerShare"
        Me.txtDividendPerShare.Size = New System.Drawing.Size(100, 20)
        Me.txtDividendPerShare.TabIndex = 1
        '
        'lblTotalShares
        '
        Me.lblTotalShares.AutoSize = True
        Me.lblTotalShares.Location = New System.Drawing.Point(34, 79)
        Me.lblTotalShares.Name = "lblTotalShares"
        Me.lblTotalShares.Size = New System.Drawing.Size(67, 13)
        Me.lblTotalShares.TabIndex = 2
        Me.lblTotalShares.Text = "Total Shares"
        '
        'txtTotalShares
        '
        Me.txtTotalShares.Location = New System.Drawing.Point(149, 79)
        Me.txtTotalShares.Name = "txtTotalShares"
        Me.txtTotalShares.Size = New System.Drawing.Size(100, 20)
        Me.txtTotalShares.TabIndex = 3
        '
        'lblDividentAmount
        '
        Me.lblDividentAmount.AutoSize = True
        Me.lblDividentAmount.Location = New System.Drawing.Point(37, 119)
        Me.lblDividentAmount.Name = "lblDividentAmount"
        Me.lblDividentAmount.Size = New System.Drawing.Size(85, 13)
        Me.lblDividentAmount.TabIndex = 4
        Me.lblDividentAmount.Text = "Divident Amount"
        '
        'lblDividendOutput
        '
        Me.lblDividendOutput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblDividendOutput.Location = New System.Drawing.Point(149, 118)
        Me.lblDividendOutput.Name = "lblDividendOutput"
        Me.lblDividendOutput.Size = New System.Drawing.Size(100, 23)
        Me.lblDividendOutput.TabIndex = 5
        '
        'btnCalculate
        '
        Me.btnCalculate.Location = New System.Drawing.Point(40, 163)
        Me.btnCalculate.Name = "btnCalculate"
        Me.btnCalculate.Size = New System.Drawing.Size(209, 27)
        Me.btnCalculate.TabIndex = 6
        Me.btnCalculate.Text = "Calculate Dividend To Pay"
        Me.btnCalculate.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 202)
        Me.Controls.Add(Me.btnCalculate)
        Me.Controls.Add(Me.lblDividendOutput)
        Me.Controls.Add(Me.lblDividentAmount)
        Me.Controls.Add(Me.txtTotalShares)
        Me.Controls.Add(Me.lblTotalShares)
        Me.Controls.Add(Me.txtDividendPerShare)
        Me.Controls.Add(Me.lblDividendPerShare)
        Me.Name = "Form1"
        Me.Text = "Dividend Calculator"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblDividendPerShare As System.Windows.Forms.Label
    Friend WithEvents txtDividendPerShare As System.Windows.Forms.TextBox
    Friend WithEvents lblTotalShares As System.Windows.Forms.Label
    Friend WithEvents txtTotalShares As System.Windows.Forms.TextBox
    Friend WithEvents lblDividentAmount As System.Windows.Forms.Label
    Friend WithEvents lblDividendOutput As System.Windows.Forms.Label
    Friend WithEvents btnCalculate As System.Windows.Forms.Button

End Class
