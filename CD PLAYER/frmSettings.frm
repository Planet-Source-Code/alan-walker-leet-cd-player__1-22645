VERSION 5.00
Begin VB.Form frmSettings 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Settings"
   ClientHeight    =   1350
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2850
   Icon            =   "frmSettings.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1350
   ScaleWidth      =   2850
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdSaveSettings 
      Caption         =   "&Ok"
      Default         =   -1  'True
      Height          =   285
      Left            =   2025
      TabIndex        =   3
      Top             =   1050
      Width           =   795
   End
   Begin VB.Frame frmSettings 
      Caption         =   "Display Settings..."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   945
      Left            =   45
      TabIndex        =   0
      Top             =   60
      Width           =   2775
      Begin VB.OptionButton optRemaining 
         Caption         =   "Show Remaining Track Time"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   90
         TabIndex        =   2
         Top             =   540
         Width           =   2460
      End
      Begin VB.OptionButton optcurrent 
         Caption         =   "Show Current Track Time"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   90
         TabIndex        =   1
         Top             =   255
         Value           =   -1  'True
         Width           =   2160
      End
   End
End
Attribute VB_Name = "frmSettings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdSaveSettings_Click()
Me.Hide
End Sub
