#include "CompInfo.au3" ;If you are wanting to pull WMI data from different computers then Declare $cI_CompName as the computer name before the include.

#region Header
#comments-start
	Title:			Computer Information Automation UDF Library for AutoIt3 - EXAMPLES
	Filename:		CompInfoExamples.au3
	Description:	Examples using the UDF's from CompInfo.au3
	Author:			Jarvis J. Stubblefield (JSThePatriot) http://www.vortexrevolutions.com/
	Version:		00.03.08
	Last Update:	11.09.06
	Requirements:	AutoIt v3.2 +, Developed/Tested on WindowsXP Pro Service Pack 2
	Notes:			Errors associated with incorrect objects will be common user errors. AutoIt beta 3.1.1.63 has added an ObjName()
	function that will be used to trap and report most of these errors.

	Special thanks to Firestorm (Testing, Use), Koala (Testing, Bug Fix), and everyone else that has helped in the creation of this Example File.
#comments-end
#endregion Header

#region -- Operating Systems
;NOTE: OSs contains alot of information, and may require a different output format.
#include "CompInfo.au3" ;If you are wanting to pull WMI data from different computers then Declare $cI_CompName as the computer name before the include.
Dim $OSs

Dim $OsName

Select
   Case @OSVersion = "WIN_7"
	  $OsName = "Windows 7"
EndSelect

_ComputerGetOSs($OSs)
If @error Then
	$error = @error
	$extended = @extended
	Switch $extended
		Case 1
			_ErrorMsg($ERR_NO_INFO)
		Case 2
			_ErrorMsg($ERR_NOT_OBJ)
	EndSwitch
 EndIf
 #comments-start
For $i = 1 To $OSs[0][0] Step 1
	MsgBox(0, "Test _ComputerGetOSs", "Name: " & $OSs[$i][0] & @CRLF & _
			"Boot Device: " & $OSs[$i][1] & @CRLF & _
			"Build Number: " & $OSs[$i][2] & @CRLF & _
			"Build Type: " & $OSs[$i][3] & @CRLF & _
			"Description: " & $OSs[$i][4] & @CRLF & _
			"Code Set: " & $OSs[$i][5] & @CRLF & _
			"Country Code: " & $OSs[$i][6] & @CRLF & _
			"Creation Class Name: " & $OSs[$i][7] & @CRLF & _
			"CSCreation Class Name: " & $OSs[$i][8] & @CRLF & _
			"CSD Version: " & $OSs[$i][9] & @CRLF & _
			"CS Name: " & $OSs[$i][10] & @CRLF & _
			"Current Time Zone: " & $OSs[$i][11] & @CRLF & _
			"Data Execution Prevention_32BitApplications: " & $OSs[$i][12] & @CRLF & _
			"Data Execution Prevention_Available: " & $OSs[$i][13] & @CRLF & _
			"Data Execution Prevention_Drivers: " & $OSs[$i][14] & @CRLF & _
			"Data Execution Prevention_SupportPolicy: " & $OSs[$i][15] & @CRLF & _
			"Debug: " & $OSs[$i][16] & @CRLF & _
			"Distributed: " & $OSs[$i][17] & @CRLF & _
			"Encryption Level: " & $OSs[$i][18] & @CRLF & _
			"Foreground Application Boost: " & $OSs[$i][19] & @CRLF & _
			"Free Physical Memory: " & $OSs[$i][20] & @CRLF & _
			"Free Space In Paging Files: " & $OSs[$i][21] & @CRLF & _
			"Free Virtual Memory: " & $OSs[$i][22] & @CRLF & _
			"Install Date: " & $OSs[$i][23] & @CRLF & _
			"Large System Cache: " & $OSs[$i][24] & @CRLF & _
			"Last Boot Up Time: " & $OSs[$i][25] & @CRLF & _
			"Local Date Time: " & $OSs[$i][26] & @CRLF & _
			"Locale: " & $OSs[$i][27] & @CRLF & _
			"Manufacturer: " & $OSs[$i][28] & @CRLF & _
			"Max Number Of Processes: " & $OSs[$i][29] & @CRLF & _
			"Max Process Memory Size: " & $OSs[$i][30] & @CRLF & _
			"Number Of Licensed Users: " & $OSs[$i][31] & @CRLF & _
			"Number Of Processes: " & $OSs[$i][32] & @CRLF & _
			"Number Of Users: " & $OSs[$i][33] & @CRLF & _
			"Organization: " & $OSs[$i][34] & @CRLF & _
			"OS Language: " & $OSs[$i][35] & @CRLF & _
			"OS Product Suite: " & $OSs[$i][36] & @CRLF & _
			"OS Type: " & $OSs[$i][37] & @CRLF & _
			"Other Type Description: " & $OSs[$i][38] & @CRLF & _
			"Plus Product ID: " & $OSs[$i][39] & @CRLF & _
			"Plus Version Number: " & $OSs[$i][40] & @CRLF & _
			"Primary: " & $OSs[$i][41] & @CRLF & _
			"Product Type: " & $OSs[$i][42] & @CRLF & _
			"Quantum Length: " & $OSs[$i][43] & @CRLF & _
			"Quantum Type: " & $OSs[$i][44] & @CRLF & _
			"Registered User: " & $OSs[$i][45] & @CRLF & _
			"Serial Number: " & $OSs[$i][46] & @CRLF & _
			"Service Pack Major Version: " & $OSs[$i][47] & @CRLF & _
			"Service Pack Minor Version: " & $OSs[$i][48] & @CRLF & _
			"Size Stored In Paging Files: " & $OSs[$i][49] & @CRLF & _
			"Status: " & $OSs[$i][50] & @CRLF & _
			"Suite Mask: " & $OSs[$i][51] & @CRLF & _
			"System Device: " & $OSs[$i][52] & @CRLF & _
			"System Directory: " & $OSs[$i][53] & @CRLF & _
			"System Drive: " & $OSs[$i][54] & @CRLF & _
			"Total Swap Space Size: " & $OSs[$i][55] & @CRLF & _
			"Total Virtual Memory Size: " & $OSs[$i][56] & @CRLF & _
			"Total Visible Memory Size: " & $OSs[$i][57] & @CRLF & _
			"Version: " & $OSs[$i][58] & @CRLF & _
			"Windows Directory: " & $OSs[$i][59])
Next
#comments-end
#endregion