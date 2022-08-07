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
        Me.grpPurchaseBox = New System.Windows.Forms.GroupBox()
        Me.lblQuantity = New System.Windows.Forms.Label()
        Me.lblCost = New System.Windows.Forms.Label()
        Me.txtQuantity = New System.Windows.Forms.TextBox()
        Me.txtCost = New System.Windows.Forms.TextBox()
        Me.grpCustomerBox = New System.Windows.Forms.GroupBox()
        Me.chkEmployee = New System.Windows.Forms.CheckBox()
        Me.btnCalculate = New System.Windows.Forms.Button()
        Me.lblTotalSaleLabel = New System.Windows.Forms.Label()
        Me.lblTotalSale = New System.Windows.Forms.Label()
        Me.grpPurchaseBox.SuspendLayout()
        Me.grpCustomerBox.SuspendLayout()
        Me.SuspendLayout()
        '
        'grpPurchaseBox
        '
        Me.grpPurchaseBox.Controls.Add(Me.txtCost)
        Me.grpPurchaseBox.Controls.Add(Me.txtQuantity)
        Me.grpPurchaseBox.Controls.Add(Me.lblCost)
        Me.grpPurchaseBox.Controls.Add(Me.lblQuantity)
        Me.grpPurchaseBox.Location = New System.Drawing.Point(25, 24)
        Me.grpPurchaseBox.Name = "grpPurchaseBox"
        Me.grpPurchaseBox.Size = New System.Drawing.Size(271, 100)
        Me.grpPurchaseBox.TabIndex = 0
        Me.grpPurchaseBox.TabStop = False
        Me.grpPurchaseBox.Text = "Purchase Information"
        '
        'lblQuantity
        '
        Me.lblQuantity.AutoSize = True
        Me.lblQuantity.Location = New System.Drawing.Point(18, 27)
        Me.lblQuantity.Name = "lblQuantity"
        Me.lblQuantity.Size = New System.Drawing.Size(46, 13)
        Me.lblQuantity.TabIndex = 2
        Me.lblQuantity.Text = "Quantity"
        '
        'lblCost
        '
        Me.lblCost.AutoSize = True
        Me.lblCost.Location = New System.Drawing.Point(18, 60)
        Me.lblCost.Name = "lblCost"
        Me.lblCost.Size = New System.Drawing.Size(28, 13)
        Me.lblCost.TabIndex = 3
        Me.lblCost.Text = "Cost"
        '
        'txtQuantity
        '
        Me.txtQuantity.Location = New System.Drawing.Point(73, 24)
        Me.txtQuantity.Name = "txtQuantity"
        Me.txtQuantity.Size = New System.Drawing.Size(181, 20)
        Me.txtQuantity.TabIndex = 4
        '
        'txtCost
        '
        Me.txtCost.Location = New System.Drawing.Point(73, 57)
        Me.txtCost.Name = "txtCost"
        Me.txtCost.Size = New System.Drawing.Size(181, 20)
        Me.txtCost.TabIndex = 5
        '
        'grpCustomerBox
        '
        Me.grpCustomerBox.Controls.Add(Me.chkEmployee)
        Me.grpCustomerBox.Location = New System.Drawing.Point(319, 24)
        Me.grpCustomerBox.Name = "grpCustomerBox"
        Me.grpCustomerBox.Size = New System.Drawing.Size(157, 100)
        Me.grpCustomerBox.TabIndex = 1
        Me.grpCustomerBox.TabStop = False
        Me.grpCustomerBox.Text = "Customer Information"
        '
        'chkEmployee
        '
        Me.chkEmployee.AutoSize = True
        Me.chkEmployee.Location = New System.Drawing.Point(18, 24)
        Me.chkEmployee.Name = "chkEmployee"
        Me.chkEmployee.Size = New System.Drawing.Size(72, 17)
        Me.chkEmployee.TabIndex = 0
        Me.chkEmployee.Text = "Employee"
        Me.chkEmployee.UseVisualStyleBackColor = True
        '
        'btnCalculate
        '
        Me.btnCalculate.Location = New System.Drawing.Point(25, 130)
        Me.btnCalculate.Name = "btnCalculate"
        Me.btnCalculate.Size = New System.Drawing.Size(190, 43)
        Me.btnCalculate.TabIndex = 2
        Me.btnCalculate.Text = "Calculate Sales"
        Me.btnCalculate.UseVisualStyleBackColor = True
        '
        'lblTotalSaleLabel
        '
        Me.lblTotalSaleLabel.AutoSize = True
        Me.lblTotalSaleLabel.Location = New System.Drawing.Point(240, 145)
        Me.lblTotalSaleLabel.Name = "lblTotalSaleLabel"
        Me.lblTotalSaleLabel.Size = New System.Drawing.Size(55, 13)
        Me.lblTotalSaleLabel.TabIndex = 3
        Me.lblTotalSaleLabel.Text = "Total Sale"
        '
        'lblTotalSale
        '
        Me.lblTotalSale.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblTotalSale.Location = New System.Drawing.Point(301, 142)
        Me.lblTotalSale.Name = "lblTotalSale"
        Me.lblTotalSale.Size = New System.Drawing.Size(175, 23)
        Me.lblTotalSale.TabIndex = 4
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(501, 185)
        Me.Controls.Add(Me.lblTotalSale)
        Me.Controls.Add(Me.lblTotalSaleLabel)
        Me.Controls.Add(Me.btnCalculate)
        Me.Controls.Add(Me.grpCustomerBox)
        Me.Controls.Add(Me.grpPurchaseBox)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.grpPurchaseBox.ResumeLayout(False)
        Me.grpPurchaseBox.PerformLayout()
        Me.grpCustomerBox.ResumeLayout(False)
        Me.grpCustomerBox.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents grpPurchaseBox As System.Windows.Forms.GroupBox
    Friend WithEvents txtCost As System.Windows.Forms.TextBox
    Friend WithEvents txtQuantity As System.Windows.Forms.TextBox
    Friend WithEvents lblCost As System.Windows.Forms.Label
    Friend WithEvents lblQuantity As System.Windows.Forms.Label
    Friend WithEvents grpCustomerBox As System.Windows.Forms.GroupBox
    Friend WithEvents chkEmployee As System.Windows.Forms.CheckBox
    Friend WithEvents btnCalculate As System.Windows.Forms.Button
    Friend WithEvents lblTotalSaleLabel As System.Windows.Forms.Label
    Friend WithEvents lblTotalSale As System.Windows.Forms.Label

End Class
