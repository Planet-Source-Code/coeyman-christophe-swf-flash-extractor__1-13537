VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Flash Hack"
   ClientHeight    =   4245
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5055
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   5055
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Find!"
      Height          =   495
      Left            =   2520
      TabIndex        =   4
      Top             =   1200
      Width           =   2415
   End
   Begin VB.FileListBox File1 
      Height          =   1650
      Left            =   120
      Pattern         =   "*.exe"
      TabIndex        =   2
      Top             =   2520
      Width           =   1935
   End
   Begin VB.DirListBox Dir1 
      Height          =   1890
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   1935
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1935
   End
   Begin VB.Label Label3 
      Caption         =   "cRaZy HaCkEr 2000 !!!"
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   3960
      Width           =   2295
   End
   Begin VB.Label Label2 
      Height          =   1455
      Left            =   2520
      TabIndex        =   5
      Top             =   1920
      Width           =   2415
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      Height          =   375
      Left            =   2520
      TabIndex        =   3
      Top             =   480
      Width           =   2295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim pt As Long
Dim pos As Long
Dim strtmp As String * 64000
Dim is_find As Boolean
is_find = False
If (File1 = "") Then
    MsgBox "No file selected"
    Exit Sub
End If
Open Dir1 + "\" + File1 For Binary Access Read Lock Read As #1
Open Dir1 + "\" + Mid(File1, 1, Len(File1) - 4) + ".swf" For Binary Access Write As #2

Do While Not EOF(1)
Get #1, , strtmp

If (InStr(UCase(strtmp), UCase("FWS")) <> 0) Then
pos = pt + InStr(UCase(strtmp), UCase("FWS"))
Label2 = "find at " + CStr(pos) + " and  extract to " + Mid(File1, 1, Len(File1) - 4) + ".swf"
is_find = True
End If
pt = Len(strtmp) + pt
Loop
If (is_find = True) Then
Seek #1, pos

Do While Not EOF(1)
Get #1, , strtmp
Put #2, , strtmp

Loop
Else
MsgBox "no swf found"
End If


Close #1
Close #2

End Sub

Private Sub Dir1_Change()
File1.Path = Dir1
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1
End Sub

Private Sub File1_Click()
Label1 = File1.filename
End Sub
