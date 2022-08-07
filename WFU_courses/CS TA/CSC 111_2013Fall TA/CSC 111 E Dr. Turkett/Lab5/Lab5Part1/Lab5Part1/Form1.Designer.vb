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
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.radFemale = New System.Windows.Forms.RadioButton()
        Me.radMale = New System.Windows.Forms.RadioButton()
        Me.btnAnalyze = New System.Windows.Forms.Button()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.radWFU = New System.Windows.Forms.RadioButton()
        Me.radUNC = New System.Windows.Forms.RadioButton()
        Me.radDuke = New System.Windows.Forms.RadioButton()
        Me.lblAge = New System.Windows.Forms.Label()
        Me.txtAge = New System.Windows.Forms.TextBox()
        Me.lblTarget = New System.Windows.Forms.Label()
        Me.lblTargetOutput = New System.Windows.Forms.Label()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.radFemale)
        Me.GroupBox1.Controls.Add(Me.radMale)
        Me.GroupBox1.Location = New System.Drawing.Point(27, 12)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(114, 72)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Sex"
        '
        'radFemale
        '
        Me.radFemale.AutoSize = True
        Me.radFemale.Checked = True
        Me.radFemale.Location = New System.Drawing.Point(6, 43)
        Me.radFemale.Name = "radFemale"
        Me.radFemale.Size = New System.Drawing.Size(59, 17)
        Me.radFemale.TabIndex = 1
        Me.radFemale.TabStop = True
        Me.radFemale.Text = "Female"
        Me.radFemale.UseVisualStyleBackColor = True
        '
        'radMale
        '
        Me.radMale.AutoSize = True
        Me.radMale.Location = New System.Drawing.Point(7, 20)
        Me.radMale.Name = "radMale"
        Me.radMale.Size = New System.Drawing.Size(48, 17)
        Me.radMale.TabIndex = 0
        Me.radMale.Text = "Male"
        Me.radMale.UseVisualStyleBackColor = True
        '
        'btnAnalyze
        '
        Me.btnAnalyze.Location = New System.Drawing.Point(12, 132)
        Me.btnAnalyze.Name = "btnAnalyze"
        Me.btnAnalyze.Size = New System.Drawing.Size(288, 23)
        Me.btnAnalyze.TabIndex = 1
        Me.btnAnalyze.Text = "Analyze Customer Information"
        Me.btnAnalyze.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.radWFU)
        Me.GroupBox2.Controls.Add(Me.radUNC)
        Me.GroupBox2.Controls.Add(Me.radDuke)
        Me.GroupBox2.Location = New System.Drawing.Point(184, 12)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(116, 96)
        Me.GroupBox2.TabIndex = 2
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "University"
        '
        'radWFU
        '
        Me.radWFU.AutoSize = True
        Me.radWFU.Location = New System.Drawing.Point(6, 66)
        Me.radWFU.Name = "radWFU"
        Me.radWFU.Size = New System.Drawing.Size(50, 17)
        Me.radWFU.TabIndex = 2
        Me.radWFU.Text = "WFU"
        Me.radWFU.UseVisualStyleBackColor = True
        '
        'radUNC
        '
        Me.radUNC.AutoSize = True
        Me.radUNC.Location = New System.Drawing.Point(6, 43)
        Me.radUNC.Name = "radUNC"
        Me.radUNC.Size = New System.Drawing.Size(48, 17)
        Me.radUNC.TabIndex = 1
        Me.radUNC.Text = "UNC"
        Me.radUNC.UseVisualStyleBackColor = True
        '
        'radDuke
        '
        Me.radDuke.AutoSize = True
        Me.radDuke.Checked = True
        Me.radDuke.Location = New System.Drawing.Point(6, 20)
        Me.radDuke.Name = "radDuke"
        Me.radDuke.Size = New System.Drawing.Size(51, 17)
        Me.radDuke.TabIndex = 0
        Me.radDuke.TabStop = True
        Me.radDuke.Text = "Duke"
        Me.radDuke.UseVisualStyleBackColor = True
        '
        'lblAge
        '
        Me.lblAge.AutoSize = True
        Me.lblAge.Location = New System.Drawing.Point(12, 95)
        Me.lblAge.Name = "lblAge"
        Me.lblAge.Size = New System.Drawing.Size(29, 13)
        Me.lblAge.TabIndex = 3
        Me.lblAge.Text = "Age:"
        '
        'txtAge
        '
        Me.txtAge.Location = New System.Drawing.Point(47, 92)
        Me.txtAge.Name = "txtAge"
        Me.txtAge.Size = New System.Drawing.Size(94, 20)
        Me.txtAge.TabIndex = 4
        '
        'lblTarget
        '
        Me.lblTarget.AutoSize = True
        Me.lblTarget.Location = New System.Drawing.Point(12, 186)
        Me.lblTarget.Name = "lblTarget"
        Me.lblTarget.Size = New System.Drawing.Size(91, 13)
        Me.lblTarget.TabIndex = 5
        Me.lblTarget.Text = "Target Customer?"
        '
        'lblTargetOutput
        '
        Me.lblTargetOutput.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblTargetOutput.Location = New System.Drawing.Point(102, 176)
        Me.lblTargetOutput.Name = "lblTargetOutput"
        Me.lblTargetOutput.Size = New System.Drawing.Size(198, 23)
        Me.lblTargetOutput.TabIndex = 6
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(322, 216)
        Me.Controls.Add(Me.lblTargetOutput)
        Me.Controls.Add(Me.lblTarget)
        Me.Controls.Add(Me.txtAge)
        Me.Controls.Add(Me.lblAge)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.btnAnalyze)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "Form1"
        Me.Text = "Customer Analysis"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents radFemale As System.Windows.Forms.RadioButton
    Friend WithEvents radMale As System.Windows.Forms.RadioButton
    Friend WithEvents btnAnalyze As System.Windows.Forms.Button
    Public WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents radWFU As System.Windows.Forms.RadioButton
    Friend WithEvents radUNC As System.Windows.Forms.RadioButton
    Friend WithEvents radDuke As System.Windows.Forms.RadioButton
    Friend WithEvents lblAge As System.Windows.Forms.Label
    Friend WithEvents txtAge As System.Windows.Forms.TextBox
    Friend WithEvents lblTarget As System.Windows.Forms.Label
    Friend WithEvents lblTargetOutput As System.Windows.Forms.Label

End Class
