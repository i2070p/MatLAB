.386
.model flat, stdcall
option casemap :none

include C:\masm32\INCLUDE\windows.inc
include C:\masm32\INCLUDE\user32.inc
include C:\masm32\INCLUDE\kernel32.inc
include C:\masm32\INCLUDE\gdi32.inc
includelib C:\masm32\LIB\user32.lib
includelib C:\masm32\LIB\kernel32.lib
includelib C:\masm32\LIB\gdi32.lib

ID_DLG_MAIN = 100
ID_SHOWM = 101

.data?
hInstance dd ?
.data
Tytul_okna byte "Moj program cos", 0
Tekst_w_oknie byte "Komunikat", 0
.code
DlgProc proc hDlg, uMsg, wParam, lParam : Dword
LOCAL hDC : DWORD
LOCAL Ps : PAINTSTRUCT
pushad
.IF uMsg == WM_CLOSE
invoke EndDialog, hDlg, 0
.ELSEIF uMsg == WM_COMMAND
.IF wParam == ID_SHOWM
invoke MessageBox, NULL, ADDR Tekst_w_oknie, ADDR Tytul_okna, MB_OK
.ENDIF
.ELSEIF uMsg == WM_PAINT
invoke BeginPaint, hDlg, ADDR Ps
mov hDC, eax
invoke MoveToEx, hDC, 10, 10, NULL
invoke LineTo, hDC, 100, 100
invoke EndPaint, hDlg, ADDR Ps
.ENDIF
popad
xor eax, eax
ret
DlgProc endp
Start:
invoke GetModuleHandle, NULL
mov hInstance, eax
invoke DialogBoxParam, hInstance, ID_DLG_MAIN, 0, ADDR DlgProc, 0
invoke ExitProcess, 0
END Start
