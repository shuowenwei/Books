﻿<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
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
        Me.btnAnalyze = New System.Windows.Forms.Button()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.lblSalesOutput = New System.Windows.Forms.Label()
        Me.lblNameOutput = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnAnalyze
        '
        Me.btnAnalyze.Location = New System.Drawing.Point(13, 13)
        Me.btnAnalyze.Name = "btnAnalyze"
        Me.btnAnalyze.Size = New System.Drawing.Size(259, 23)
        Me.btnAnalyze.TabIndex = 0
        Me.btnAnalyze.Text = "Analyze Sales Teams"
        Me.btnAnalyze.UseVisualStyleBackColor = True
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.lblSalesOutput)
        Me.GroupBox1.Controls.Add(Me.lblNameOutput)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Location = New System.Drawing.Point(13, 42)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(259, 85)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Worst Performing Team"
        '
        'lblSalesOutput
        '
        Me.lblSalesOutput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblSalesOutput.Location = New System.Drawing.Point(78, 59)
        Me.lblSalesOutput.Name = "lblSalesOutput"
        Me.lblSalesOutput.Size = New System.Drawing.Size(175, 23)
        Me.lblSalesOutput.TabIndex = 3
        '
        'lblNameOutput
        '
        Me.lblNameOutput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblNameOutput.Location = New System.Drawing.Point(78, 28)
        Me.lblNameOutput.Name = "lblNameOutput"
        Me.lblNameOutput.Size = New System.Drawing.Size(174, 23)
        Me.lblNameOutput.TabIndex = 2
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(6, 60)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(66, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Team Sales:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(7, 29)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(68, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Team Name:"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 135)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.btnAnalyze)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents btnAnalyze As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents lblSalesOutput As System.Windows.Forms.Label
    Friend WithEvents lblNameOutput As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label

End Class
