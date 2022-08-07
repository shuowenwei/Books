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
        Me.lblPackageASold = New System.Windows.Forms.Label()
        Me.txtPackageACopies = New System.Windows.Forms.TextBox()
        Me.lblPackageBSold = New System.Windows.Forms.Label()
        Me.txtPackageBCopies = New System.Windows.Forms.TextBox()
        Me.lblTotalSalesLabel = New System.Windows.Forms.Label()
        Me.lblTotalDiscountLabel = New System.Windows.Forms.Label()
        Me.lblTotalSales = New System.Windows.Forms.Label()
        Me.lblTotalDiscount = New System.Windows.Forms.Label()
        Me.btnCalculateSales = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblPackageASold
        '
        Me.lblPackageASold.AutoSize = True
        Me.lblPackageASold.Location = New System.Drawing.Point(28, 36)
        Me.lblPackageASold.Name = "lblPackageASold"
        Me.lblPackageASold.Size = New System.Drawing.Size(137, 13)
        Me.lblPackageASold.TabIndex = 0
        Me.lblPackageASold.Text = "Copies of Package A Sold: "
        '
        'txtPackageACopies
        '
        Me.txtPackageACopies.Location = New System.Drawing.Point(184, 28)
        Me.txtPackageACopies.Name = "txtPackageACopies"
        Me.txtPackageACopies.Size = New System.Drawing.Size(130, 20)
        Me.txtPackageACopies.TabIndex = 1
        '
        'lblPackageBSold
        '
        Me.lblPackageBSold.AutoSize = True
        Me.lblPackageBSold.Location = New System.Drawing.Point(28, 83)
        Me.lblPackageBSold.Name = "lblPackageBSold"
        Me.lblPackageBSold.Size = New System.Drawing.Size(137, 13)
        Me.lblPackageBSold.TabIndex = 2
        Me.lblPackageBSold.Text = "Copies of Package  B Sold:"
        '
        'txtPackageBCopies
        '
        Me.txtPackageBCopies.Location = New System.Drawing.Point(184, 76)
        Me.txtPackageBCopies.Name = "txtPackageBCopies"
        Me.txtPackageBCopies.Size = New System.Drawing.Size(130, 20)
        Me.txtPackageBCopies.TabIndex = 3
        '
        'lblTotalSalesLabel
        '
        Me.lblTotalSalesLabel.AutoSize = True
        Me.lblTotalSalesLabel.Location = New System.Drawing.Point(31, 136)
        Me.lblTotalSalesLabel.Name = "lblTotalSalesLabel"
        Me.lblTotalSalesLabel.Size = New System.Drawing.Size(63, 13)
        Me.lblTotalSalesLabel.TabIndex = 4
        Me.lblTotalSalesLabel.Text = "Total Sales:"
        '
        'lblTotalDiscountLabel
        '
        Me.lblTotalDiscountLabel.AutoSize = True
        Me.lblTotalDiscountLabel.Location = New System.Drawing.Point(31, 175)
        Me.lblTotalDiscountLabel.Name = "lblTotalDiscountLabel"
        Me.lblTotalDiscountLabel.Size = New System.Drawing.Size(117, 13)
        Me.lblTotalDiscountLabel.TabIndex = 5
        Me.lblTotalDiscountLabel.Text = "Total Discount Applied:"
        '
        'lblTotalSales
        '
        Me.lblTotalSales.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblTotalSales.Location = New System.Drawing.Point(184, 136)
        Me.lblTotalSales.Name = "lblTotalSales"
        Me.lblTotalSales.Size = New System.Drawing.Size(130, 23)
        Me.lblTotalSales.TabIndex = 6
        '
        'lblTotalDiscount
        '
        Me.lblTotalDiscount.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblTotalDiscount.Location = New System.Drawing.Point(184, 174)
        Me.lblTotalDiscount.Name = "lblTotalDiscount"
        Me.lblTotalDiscount.Size = New System.Drawing.Size(130, 23)
        Me.lblTotalDiscount.TabIndex = 7
        '
        'btnCalculateSales
        '
        Me.btnCalculateSales.Location = New System.Drawing.Point(31, 221)
        Me.btnCalculateSales.Name = "btnCalculateSales"
        Me.btnCalculateSales.Size = New System.Drawing.Size(283, 23)
        Me.btnCalculateSales.TabIndex = 8
        Me.btnCalculateSales.Text = "Calculate Sales"
        Me.btnCalculateSales.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(347, 274)
        Me.Controls.Add(Me.btnCalculateSales)
        Me.Controls.Add(Me.lblTotalDiscount)
        Me.Controls.Add(Me.lblTotalSales)
        Me.Controls.Add(Me.lblTotalDiscountLabel)
        Me.Controls.Add(Me.lblTotalSalesLabel)
        Me.Controls.Add(Me.txtPackageBCopies)
        Me.Controls.Add(Me.lblPackageBSold)
        Me.Controls.Add(Me.txtPackageACopies)
        Me.Controls.Add(Me.lblPackageASold)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblPackageASold As System.Windows.Forms.Label
    Friend WithEvents txtPackageACopies As System.Windows.Forms.TextBox
    Friend WithEvents lblPackageBSold As System.Windows.Forms.Label
    Friend WithEvents txtPackageBCopies As System.Windows.Forms.TextBox
    Friend WithEvents lblTotalSalesLabel As System.Windows.Forms.Label
    Friend WithEvents lblTotalDiscountLabel As System.Windows.Forms.Label
    Friend WithEvents lblTotalSales As System.Windows.Forms.Label
    Friend WithEvents lblTotalDiscount As System.Windows.Forms.Label
    Friend WithEvents btnCalculateSales As System.Windows.Forms.Button

End Class
