SetCompressor LZMA

!define VlivName "Vliv ${VERSION}"
Name "${VlivName}"
OutFile "vliv${VERSIONSHORT}.exe"
InstallDir $PROGRAMFILES\Vliv
InstallDirRegKey HKLM "Software\Delhoume\Vliv" "Install_Dir"
XPStyle on

;Include Modern UI 2
!include "MUI2.nsh" 

;Modern UI Configuration
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "header.bmp"
!define MUI_FINISHPAGE_RUN_TEXT     "Run ${VlivName}" 
!define MUI_FINISHPAGE_RUN_FUNCTION "RunUI"
!define MUI_FINISHPAGE_RUN

;Pages
;!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "License.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
 
;!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
;!insertmacro MUI_UNPAGE_FINISH

;Languages
!insertmacro MUI_LANGUAGE "English"

Section "${VlivName} (required)"
SectionIn RO
SetOutPath $INSTDIR
File "..\vliv\src\vliv.exe"
File "..\vliv\src\components\ownd.dll"
SetOutPath $INSTDIR\plugins
File "..\vlivplugins\internal\vliv.dll"
File "..\vlivplugins\avi\avi.dll"
;File "..\vlivplugins\jpeg2000\jpeg2000.dll"
File "..\vlivplugins\qoi\qoi.dll"
;File "..\vlivplugins\webp\webp.dll"
;File "..\vlivplugins\wic\wic.dll"
File "..\vliv\src\plugins\debug\debug.dll"
File "..\vliv\src\plugins\newton\newton.dll"
File "..\vliv\src\plugins\lyapunov\lyapunov.dll"
SetOutPath $INSTDIR\devel
File "..\vliv\src\vliv.h"
File "..\vliv\src\plugins\newton\newton.c"
File "..\vliv\src\plugins\newton\newton.h"
File "..\vliv\src\plugins\newton\newton.mak"
File "..\vliv\src\plugins\debug\debug.c"
File "..\vliv\src\plugins\debug\debug.h"
File "..\vliv\src\plugins\debug\debug.mak"
File "..\vliv\src\plugins\lyapunov\lyapunov.c"
File "..\vliv\src\plugins\lyapunov\lyapunov.h"
File "..\vliv\src\plugins\lyapunov\lyapunov.mak"
WriteRegStr HKLM SOFTWARE\Delhoume\Vliv "Install-Dir" "$INSTDIR"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Vliv" "DisplayName" "${VlivName}"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Vliv" "UninstallString" '"$INSTDIR\uninstall.exe"'
WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Start Menu Shortcuts"
CreateDirectory "$SMPROGRAMS\${VlivName}"
CreateShortCut "$SMPROGRAMS\${VlivName}\${VlivName}.lnk" "$INSTDIR\vliv.exe" ""  "$INSTDIR\vliv.exe"
CreateShortCut "$SMPROGRAMS\${VlivName}\Changes.lnk" "$INSTDIR\changes.txt" "" "$INSTDIR\changes.txt"
CreateShortCut "$SMPROGRAMS\${VlivName}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Vliv"
DeleteRegKey HKLM "SOFTWARE\Delhoume\Vliv"

Delete $INSTDIR\vliv.exe
Delete $INSTDIR\changes.txt
Delete $INSTDIR\uninstall.exe
Delete "$SMPROGRAMS\${VlivName}\*.*"
RMDir "$SMPROGRAMS\${VlivName}"
RMDir "$INSTDIR"
SectionEnd

Function RunUI
  Exec "$INSTDIR\vliv.exe"
FunctionEnd
