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
        Me.lblItemsSoldLabel = New System.Windows.Forms.Label()
        Me.lblTotalPriceLabel = New System.Windows.Forms.Label()
        Me.lblItemsSoldOutput = New System.Windows.Forms.Label()
        Me.lblTotalPriceOutput = New System.Windows.Forms.Label()
        Me.btnEnterSales = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblItemsSoldLabel
        '
        Me.lblItemsSoldLabel.AutoSize = True
        Me.lblItemsSoldLabel.Location = New System.Drawing.Point(21, 36)
        Me.lblItemsSoldLabel.Name = "lblItemsSoldLabel"
        Me.lblItemsSoldLabel.Size = New System.Drawing.Size(113, 13)
        Me.lblItemsSoldLabel.TabIndex = 0
        Me.lblItemsSoldLabel.Text = "Number Of Items Sold:"
        '
        'lblTotalPriceLabel
        '
        Me.lblTotalPriceLabel.AutoSize = True
        Me.lblTotalPriceLabel.Location = New System.Drawing.Point(198, 36)
        Me.lblTotalPriceLabel.Name = "lblTotalPriceLabel"
        Me.lblTotalPriceLabel.Size = New System.Drawing.Size(61, 13)
        Me.lblTotalPriceLabel.TabIndex = 1
        Me.lblTotalPriceLabel.Text = "Total Price:"
        '
        'lblItemsSoldOutput
        '
        Me.lblItemsSoldOutput.Location = New System.Drawing.Point(131, 36)
        Me.lblItemsSoldOutput.Name = "lblItemsSoldOutput"
        Me.lblItemsSoldOutput.Size = New System.Drawing.Size(51, 23)
        Me.lblItemsSoldOutput.TabIndex = 2
        Me.lblItemsSoldOutput.Text = "0"
        '
        'lblTotalPriceOutput
        '
        Me.lblTotalPriceOutput.Location = New System.Drawing.Point(265, 36)
        Me.lblTotalPriceOutput.Name = "lblTotalPriceOutput"
        Me.lblTotalPriceOutput.Size = New System.Drawing.Size(100, 23)
        Me.lblTotalPriceOutput.TabIndex = 3
        Me.lblTotalPriceOutput.Text = "0"
        '
        'btnEnterSales
        '
        Me.btnEnterSales.Location = New System.Drawing.Point(24, 68)
        Me.btnEnterSales.Name = "btnEnterSales"
        Me.btnEnterSales.Size = New System.Drawing.Size(351, 23)
        Me.btnEnterSales.TabIndex = 4
        Me.btnEnterSales.Text = "Enter Sales"
        Me.btnEnterSales.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(405, 115)
        Me.Controls.Add(Me.btnEnterSales)
        Me.Controls.Add(Me.lblTotalPriceOutput)
        Me.Controls.Add(Me.lblItemsSoldOutput)
        Me.Controls.Add(Me.lblTotalPriceLabel)
        Me.Controls.Add(Me.lblItemsSoldLabel)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblItemsSoldLabel As System.Windows.Forms.Label
    Friend WithEvents lblTotalPriceLabel As System.Windows.Forms.Label
    Friend WithEvents lblItemsSoldOutput As System.Windows.Forms.Label
    Friend WithEvents lblTotalPriceOutput As System.Windows.Forms.Label
    Friend WithEvents btnEnterSales As System.Windows.Forms.Button

End Class
