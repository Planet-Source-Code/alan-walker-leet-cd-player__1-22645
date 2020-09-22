VERSION 5.00
Begin VB.Form frmMAIN 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CD Player"
   ClientHeight    =   990
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3165
   Icon            =   "frmMAIN.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   990
   ScaleWidth      =   3165
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdSettings 
      Caption         =   "Settings"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   2250
      TabIndex        =   7
      Top             =   630
      Width           =   915
   End
   Begin VB.Timer tmrTime 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2655
      Top             =   30
   End
   Begin VB.CommandButton cmdejectcd 
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   12
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   1875
      TabIndex        =   5
      Top             =   630
      Width           =   390
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   ":"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   12
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   1500
      TabIndex        =   4
      Top             =   630
      Width           =   390
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   12
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   1125
      TabIndex        =   3
      Top             =   630
      Width           =   390
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "<"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   12
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   750
      TabIndex        =   2
      Top             =   630
      Width           =   390
   End
   Begin VB.CommandButton cmdPause 
      Caption         =   ";"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   12
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   375
      TabIndex        =   1
      Top             =   630
      Width           =   390
   End
   Begin VB.CommandButton cmdPLAY 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   12
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   630
      Width           =   390
   End
   Begin VB.Label lblTrack 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "O"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   375
      Left            =   420
      TabIndex        =   8
      Top             =   105
      Width           =   705
   End
   Begin VB.Label lblTIME 
      BackStyle       =   0  'Transparent
      Caption         =   "Time"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   1335
      TabIndex        =   6
      Top             =   105
      Width           =   1755
   End
   Begin VB.Shape shapeBG 
      BackColor       =   &H00000000&
      BackStyle       =   1  'Opaque
      Height          =   645
      Left            =   -60
      Top             =   -30
      Width           =   3240
   End
End
Attribute VB_Name = "frmMAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Title: CD Player Example
'Author: Alan Walker
'Made With: Visual Basic 6.0 EE
'Description: A cool cd player example
'
' http://ulair.cjb.net
'
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Public cdPaused, cdOpen As Boolean

Private Sub cmdBack_Click()
PlayPrevCDTrack
End Sub

Private Sub cmdejectcd_Click()
If cdOpen = False Then
OpenCDTray
cdOpen = True
Else
CloseCDTray
cdOpen = False
End If
End Sub

Private Sub cmdNext_Click()
PlayNextCDTrack
End Sub

Private Sub cmdPause_Click()
cdPaused = True
PauseCDAudio
End Sub

Private Sub cmdPLAY_Click()
tmrTime.Enabled = True
If cdPaused = True Then
UnPauseCDAudio
cdPaused = False
Exit Sub
End If
PlayCDAudio (1)
End Sub

Private Sub cmdStop_Click()
StopCDAudio
End Sub

Private Sub cmdSettings_Click()
frmSettings.Show , Me
End Sub

Private Sub Form_Load()
lblTrack = ""
lblTIME = "0:00"
cdOpen = False
End Sub

Private Sub tmrTime_Timer()
lblTrack = GetCDCurrentTrack
If frmSettings.optcurrent.Value = True Then
lblTIME = GetCDCurrentMin & ":" & GetCDCurrentSec
ElseIf frmSettings.optRemaining.Value = True Then
lblTIME = GetCDRemainingMin & ":" & GetCDRemainingSec
End If
End Sub
