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
        Me.lblPurchase = New System.Windows.Forms.Label()
        Me.txtPurchasePrice = New System.Windows.Forms.TextBox()
        Me.lblSell = New System.Windows.Forms.Label()
        Me.txtSellPrice = New System.Windows.Forms.TextBox()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.lblIncome = New System.Windows.Forms.Label()
        Me.txtIncome = New System.Windows.Forms.TextBox()
        Me.radLess1Year = New System.Windows.Forms.RadioButton()
        Me.rad1Year = New System.Windows.Forms.RadioButton()
        Me.btnCompute = New System.Windows.Forms.Button()
        Me.lblTaxOutput = New System.Windows.Forms.Label()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'lblPurchase
        '
        Me.lblPurchase.AutoSize = True
        Me.lblPurchase.Location = New System.Drawing.Point(14, 13)
        Me.lblPurchase.Name = "lblPurchase"
        Me.lblPurchase.Size = New System.Drawing.Size(79, 13)
        Me.lblPurchase.TabIndex = 0
        Me.lblPurchase.Text = "Purchase Price"
        '
        'txtPurchasePrice
        '
        Me.txtPurchasePrice.Location = New System.Drawing.Point(99, 10)
        Me.txtPurchasePrice.Name = "txtPurchasePrice"
        Me.txtPurchasePrice.Size = New System.Drawing.Size(100, 20)
        Me.txtPurchasePrice.TabIndex = 1
        '
        'lblSell
        '
        Me.lblSell.AutoSize = True
        Me.lblSell.Location = New System.Drawing.Point(42, 49)
        Me.lblSell.Name = "lblSell"
        Me.lblSell.Size = New System.Drawing.Size(51, 13)
        Me.lblSell.TabIndex = 2
        Me.lblSell.Text = "Sell Price"
        '
        'txtSellPrice
        '
        Me.txtSellPrice.Location = New System.Drawing.Point(99, 45)
        Me.txtSellPrice.Name = "txtSellPrice"
        Me.txtSellPrice.Size = New System.Drawing.Size(100, 20)
        Me.txtSellPrice.TabIndex = 3
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.rad1Year)
        Me.GroupBox1.Controls.Add(Me.radLess1Year)
        Me.GroupBox1.Location = New System.Drawing.Point(217, 5)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(118, 63)
        Me.GroupBox1.TabIndex = 4
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Length Held"
        '
        'lblIncome
        '
        Me.lblIncome.AutoSize = True
        Me.lblIncome.Location = New System.Drawing.Point(351, 13)
        Me.lblIncome.Name = "lblIncome"
        Me.lblIncome.Size = New System.Drawing.Size(72, 13)
        Me.lblIncome.TabIndex = 5
        Me.lblIncome.Text = "Gross Income"
        '
        'txtIncome
        '
        Me.txtIncome.Location = New System.Drawing.Point(354, 29)
        Me.txtIncome.Name = "txtIncome"
        Me.txtIncome.Size = New System.Drawing.Size(116, 20)
        Me.txtIncome.TabIndex = 6
        '
        'radLess1Year
        '
        Me.radLess1Year.AutoSize = True
        Me.radLess1Year.Checked = True
        Me.radLess1Year.Location = New System.Drawing.Point(7, 20)
        Me.radLess1Year.Name = "radLess1Year"
        Me.radLess1Year.Size = New System.Drawing.Size(65, 17)
        Me.radLess1Year.TabIndex = 0
        Me.radLess1Year.TabStop = True
        Me.radLess1Year.Text = "< 1 Year"
        Me.radLess1Year.UseVisualStyleBackColor = True
        '
        'rad1Year
        '
        Me.rad1Year.AutoSize = True
        Me.rad1Year.Location = New System.Drawing.Point(7, 40)
        Me.rad1Year.Name = "rad1Year"
        Me.rad1Year.Size = New System.Drawing.Size(97, 17)
        Me.rad1Year.TabIndex = 1
        Me.rad1Year.TabStop = True
        Me.rad1Year.Text = "1 Year Or More"
        Me.rad1Year.UseVisualStyleBackColor = True
        '
        'btnCompute
        '
        Me.btnCompute.Location = New System.Drawing.Point(13, 77)
        Me.btnCompute.Name = "btnCompute"
        Me.btnCompute.Size = New System.Drawing.Size(457, 23)
        Me.btnCompute.TabIndex = 7
        Me.btnCompute.Text = "Compute Capital Gains Tax"
        Me.btnCompute.UseVisualStyleBackColor = True
        '
        'lblTaxOutput
        '
        Me.lblTaxOutput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblTaxOutput.Location = New System.Drawing.Point(173, 112)
        Me.lblTaxOutput.Name = "lblTaxOutput"
        Me.lblTaxOutput.Size = New System.Drawing.Size(139, 23)
        Me.lblTaxOutput.TabIndex = 8
        Me.lblTaxOutput.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(487, 144)
        Me.Controls.Add(Me.lblTaxOutput)
        Me.Controls.Add(Me.btnCompute)
        Me.Controls.Add(Me.txtIncome)
        Me.Controls.Add(Me.lblIncome)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.txtSellPrice)
        Me.Controls.Add(Me.lblSell)
        Me.Controls.Add(Me.txtPurchasePrice)
        Me.Controls.Add(Me.lblPurchase)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblPurchase As System.Windows.Forms.Label
    Friend WithEvents txtPurchasePrice As System.Windows.Forms.TextBox
    Friend WithEvents lblSell As System.Windows.Forms.Label
    Friend WithEvents txtSellPrice As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents rad1Year As System.Windows.Forms.RadioButton
    Friend WithEvents radLess1Year As System.Windows.Forms.RadioButton
    Friend WithEvents lblIncome As System.Windows.Forms.Label
    Friend WithEvents txtIncome As System.Windows.Forms.TextBox
    Friend WithEvents btnCompute As System.Windows.Forms.Button
    Friend WithEvents lblTaxOutput As System.Windows.Forms.Label

End Class
