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
        Me.lblUser = New System.Windows.Forms.Label()
        Me.txtUser = New System.Windows.Forms.TextBox()
        Me.btnHi = New System.Windows.Forms.Button()
        Me.btnHiBye = New System.Windows.Forms.Button()
        Me.btnGoodNight = New System.Windows.Forms.Button()
        Me.lblGreeting = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'lblUser
        '
        Me.lblUser.AutoSize = True
        Me.lblUser.Location = New System.Drawing.Point(69, 69)
        Me.lblUser.Name = "lblUser"
        Me.lblUser.Size = New System.Drawing.Size(55, 13)
        Me.lblUser.TabIndex = 0
        Me.lblUser.Text = "Username"
        '
        'txtUser
        '
        Me.txtUser.Location = New System.Drawing.Point(130, 66)
        Me.txtUser.Name = "txtUser"
        Me.txtUser.Size = New System.Drawing.Size(195, 20)
        Me.txtUser.TabIndex = 1
        '
        'btnHi
        '
        Me.btnHi.Location = New System.Drawing.Point(37, 133)
        Me.btnHi.Name = "btnHi"
        Me.btnHi.Size = New System.Drawing.Size(75, 23)
        Me.btnHi.TabIndex = 2
        Me.btnHi.Text = "Hi"
        Me.btnHi.UseVisualStyleBackColor = True
        '
        'btnHiBye
        '
        Me.btnHiBye.Location = New System.Drawing.Point(164, 133)
        Me.btnHiBye.Name = "btnHiBye"
        Me.btnHiBye.Size = New System.Drawing.Size(75, 23)
        Me.btnHiBye.TabIndex = 2
        Me.btnHiBye.Text = "Bye"
        Me.btnHiBye.UseVisualStyleBackColor = True
        '
        'btnGoodNight
        '
        Me.btnGoodNight.Location = New System.Drawing.Point(285, 133)
        Me.btnGoodNight.Name = "btnGoodNight"
        Me.btnGoodNight.Size = New System.Drawing.Size(75, 23)
        Me.btnGoodNight.TabIndex = 2
        Me.btnGoodNight.Text = "Good Night"
        Me.btnGoodNight.UseVisualStyleBackColor = True
        '
        'lblGreeting
        '
        Me.lblGreeting.Location = New System.Drawing.Point(37, 199)
        Me.lblGreeting.Name = "lblGreeting"
        Me.lblGreeting.Size = New System.Drawing.Size(323, 30)
        Me.lblGreeting.TabIndex = 3
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(404, 274)
        Me.Controls.Add(Me.lblGreeting)
        Me.Controls.Add(Me.btnGoodNight)
        Me.Controls.Add(Me.btnHiBye)
        Me.Controls.Add(Me.btnHi)
        Me.Controls.Add(Me.txtUser)
        Me.Controls.Add(Me.lblUser)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblUser As System.Windows.Forms.Label
    Friend WithEvents txtUser As System.Windows.Forms.TextBox
    Friend WithEvents btnHi As System.Windows.Forms.Button
    Friend WithEvents btnHiBye As System.Windows.Forms.Button
    Friend WithEvents btnGoodNight As System.Windows.Forms.Button
    Friend WithEvents lblGreeting As System.Windows.Forms.Label

End Class
