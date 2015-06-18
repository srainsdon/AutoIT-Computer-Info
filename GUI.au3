#include "CompInfo.au3" ;If you are wanting to pull WMI data from different computers then Declare $cI_CompName as the computer name before the include.  $aDays = StringSplit("Mon,Tues,Wed,Thur,Fri,Sat,Sun", ",")
#include "Info.au3"
#include <GuiConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#region GLOBAL VARIABLES
Global $iW = 700, $iH = 400, $iT = 52, $iB = 52, $iLeftWidth = 150, $iGap = 10, $hMainGUI
#endregion GLOBAL VARIABLES

_MainGui()

Func _MainGui()
Local $hFooter, $nMsg, $aPos
Local $iLinks = 5
Local $sMainGuiTitle = "CIA - (" & @ComputerName & ")"
Local $sHeader = "Computer Information Assembly"
Local $sFooter = "2015 © Seth Rainsdon"
Local $aLink[$iLinks], $aPanel[$iLinks]
$aLink[0] = $iLinks - 1
$aPanel[0] = $iLinks - 1
$hMainGUI = GUICreate($sMainGuiTitle, $iW, $iH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX, $WS_TABSTOP))
GUISetIcon("shell32.dll", -58, $hMainGUI) ;Top left icon

GUICtrlCreateLabel($sHeader, 48, 8, $iW - 56, 32, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 14, 800, 0, "Arial", 5)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlCreateIcon("shell32.dll", -14, 8, 8, 32, 32)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("", 0, $iT, $iW, 2, $SS_SUNKEN);separator
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("", $iLeftWidth, $iT + 2, 2, $iH - $iT - $iB - 2, $SS_SUNKEN);separator
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH)
GUICtrlCreateLabel("", 0, $iH - $iB, $iW, 2, $SS_SUNKEN);separator
GUICtrlSetResizing(-1, $GUI_DOCKBOTTOM + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT)

$hFooter = GUICtrlCreateLabel($sFooter, 10, $iH - 34, $iW - 20, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetTip(-1, "AutoIt Forum", "Click to open...")
GUICtrlSetCursor(-1, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

;add links to the left side
$aLink[1] = _AddNewLink("System Stuff", -22)
$aLink[2] = _AddNewLink("Networking", -18)
$aLink[3] = _AddNewLink("Link 3", -222)
$aLink[4] = _AddNewLink("Link 4", -22)
;and the corresponding GUI's
$aPanel[1] = _AddNewPanel("System Stuff")
$aPanel[2] = _AddNewPanel("Networking")
$aPanel[3] = _AddNewPanel("Title for the panel 3")
$aPanel[4] = _AddNewPanel("Title for the panel 4")

;add some controls to the panels
_AddControlsToPanel($aPanel[1])

Local $iWidth = 110
Local $iStartTop = 28
Local $iHight = 17
Local $iStartCol = 10
GUICtrlCreateLabel("Computer Name", $iStartCol, $iStartTop, $iWidth, $iHight)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel(@ComputerName, $iStartCol+$iWidth, $iStartTop, $iWidth, $iHight)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("Operating System", $iStartCol, $iStartTop+$iHight, $iWidth, $iHight)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel($OsName, $iStartCol+$iWidth, $iStartTop+$iHight, $iWidth, 17)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("Boot Time", $iStartCol, $iStartTop+($iHight*2), $iWidth, $iHight)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel($OSs[1][25], $iStartCol+$iWidth, $iStartTop+($iHight*2), $iWidth, 17)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

_AddControlsToPanel($aPanel[2])


GUICtrlCreateEdit("", 10, 37, $iW - $iLeftWidth + 2 - 20 - 5, $iH - $iT - $iB - 40, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL), $WS_EX_STATICEDGE)
Local $sTestTxt = ""
;For $i = 1 To 10
For $i = 1 To $OSs[0][0] Step 1
$sTestTxt &= "Computer Name: " & @TAB & @TAB & @ComputerName & @CRLF & _
   "Last Boot Up Time: " & @TAB & @TAB & $OSs[$i][25] & @CRLF & _
   "OS: " & @TAB & @TAB & @TAB & $OsName & @CRLF
;$sTestTxt &= @TAB & "Sed vel ante magna. Curabitur porttitor ante in tellus bibendum non tristique diam volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In tellus lectus, ultrices in tempus eget, sollicitudin quis eros. Curabitur at arcu bibendum massa feugiat euismod at a felis. Nunc molestie, enim non ornare tincidunt, ipsum nisi tempus sapien, quis elementum elit velit ut neque. Suspendisse eu adipiscing risus. Nam tempor odio ut elit auctor rhoncus. Etiam viverra elit id felis feugiat pellentesque pretium porttitor dui. Vivamus eu quam non ante suscipit vehicula a nec eros. Phasellus congue massa sed libero interdum ullamcorper. Quisque fringilla massa ut lorem fringilla pulvinar eget ullamcorper eros. Praesent faucibus, erat at consequat tempus, nulla erat sodales mi, eget sagittis nibh erat nec nunc. Phasellus risus nibh, porta viverra pretium nec, vehicula eget nisi." & @CRLF
;$sTestTxt &= @TAB & "Sed vel neque vel urna elementum accumsan feugiat quis mauris. Sed mi nisl, consequat dapibus molestie ac, rutrum ut elit. Praesent sed risus sem. Mauris rutrum blandit magna nec tristique. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse consequat iaculis odio nec cursus. Duis varius tincidunt ligula ac ultricies. Ut eget magna in nulla vulputate dapibus ut vel sem. Integer ac tempor risus." & @CRLF
;$sTestTxt &= @TAB & "Maecenas molestie semper turpis, id tristique nibh pharetra eget. Aliquam erat volutpat. In egestas, lorem quis varius vestibulum, enim diam porta lorem, quis dictum arcu ante a diam. Nullam vel nisi mauris. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam ut leo purus, eget vulputate augue. Fusce et est sagittis felis accumsan sollicitudin eget a lectus. Cras sapien sapien, rutrum eu tempor non, tempor nec velit. Vivamus interdum adipiscing felis in malesuada. Fusce quis purus est, eget molestie turpis. In hac habitasse platea dictumst." & @CRLF
;$sTestTxt &= @TAB & "Aenean eleifend risus vitae lorem laoreet facilisis. Suspendisse ac urna quam, vel rutrum sem. Sed bibendum porta tellus malesuada scelerisque. Vestibulum at ligula sed nulla sollicitudin tincidunt. Pellentesque mi magna, vulputate et aliquam a, auctor et nunc. Phasellus feugiat fringilla accumsan. Donec ultrices, elit id dapibus auctor, nunc odio viverra lorem, non commodo mi libero a libero. Cras vitae felis venenatis augue laoreet tincidunt scelerisque id odio. Proin lorem purus, molestie feugiat pretium nec, ornare aliquam turpis. "
Next
GUICtrlSetData(-1, $sTestTxt)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM)

_AddControlsToPanel($aPanel[3])
GUICtrlCreateList("", 8, 37, 121, 93, -1, 0)
GUICtrlSetData(-1, "dfgdfg|ertert|kljlkj|poipoi|qweqwe")
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

_AddControlsToPanel($aPanel[4])
GUICtrlCreateGroup("Group1", 8, 35, 129, 90)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $aChkBox[4]
For $i = 1 To 3
$aChkBox[$i] = GUICtrlCreateRadio("Some radio " & $i, 16, 56 + ($i - 1) * 20, 113, 17)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Next
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)

;set default to Panel1
GUISwitch($aPanel[1])
;show the main GUI
GUISetState(@SW_SHOW, $hMainGUI)

While 1
Sleep(10)
$nMsg = GUIGetMsg(1)
Switch $nMsg[1]
Case $hMainGUI
Switch $nMsg[0]
Case $GUI_EVENT_CLOSE
Exit
Case $GUI_EVENT_MINIMIZE, $GUI_EVENT_MAXIMIZE, $GUI_EVENT_RESTORE
$aPos = WinGetPos($hMainGUI)
$iW = $aPos[2]
$iH = $aPos[3]
For $i = 0 To $aPanel[0]
WinMove($aPanel[$i], "", $iLeftWidth + 2, $iT, $iW - $iLeftWidth + 2, $iH - $iT - $iB - 20)
Next
Case $aLink[1], $aLink[2], $aLink[3], $aLink[4]
For $i = 1 To $aLink[0]
If $nMsg[0] = $aLink[$i] Then
GUISetState(@SW_SHOW, $aPanel[$i])
Else
GUISetState(@SW_HIDE, $aPanel[$i])
EndIf
Next
Case $hFooter
ShellExecute("http://www.autoitscript.com/forum/topic/146952-gui-design-concepts/")
EndSwitch
Case $aPanel[2]
Switch $nMsg[0]
Case $hButton1
MsgBox(32, "Test", "You have " & GUICtrlRead($hInput1) & "?")
EndSwitch
Case $aPanel[4]
Switch $nMsg[0]
Case $aChkBox[1], $aChkBox[2], $aChkBox[3]
For $i = 1 To 3
If GUICtrlRead($aChkBox[$i]) = $GUI_CHECKED Then MsgBox(64, "Test", "You checked nr. " & $i & "!")
Next
EndSwitch
EndSwitch
WEnd
EndFunc ;==>_MainGui

Func _AddNewLink($sTxt, $iIcon = -44)
Local $hLink = GUICtrlCreateLabel($sTxt, 36, $iT + $iGap, $iLeftWidth - 46, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateIcon("shell32.dll", $iIcon, 10, $iT + $iGap, 16, 16)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$iGap += 22
Return $hLink
EndFunc ;==>_AddNewLink

Func _AddNewPanel($sTxt)
Local $gui = GUICreate("", $iW - $iLeftWidth + 2, $iH - $iT - $iB, $iLeftWidth + 2, $iT, $WS_CHILD + $WS_VISIBLE, -1, $hMainGUI)
GUICtrlCreateLabel($sTxt, 10, 10, $iW - $iLeftWidth - 20, 17, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 9, 800, 4, "Arial", 5)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Return $gui
EndFunc ;==>_AddNewPanel

Func _AddControlsToPanel($hPanel)
GUISwitch($hPanel)
EndFunc ;==>_AddControlsToPanel