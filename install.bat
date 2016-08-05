ConEmuSetup.160619.exe
msys2-x86_64-20160205.exe
gvim74.exe
winsdk_web.exe
reg import ConEmu.reg
echo UNBLOCK THE PYKD DLLS... 
Pause
copy pykd-dlls\x64\pykd.dll "C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\winext"
copy pykd-dlls\x86\pykd.dll "C:\Program Files (x86)\Windows Kits\10\Debuggers\x86\winext"
FOR /F %%i in ('DIR /B /A:D dotfiles') DO mkdir C:\msys64\home\%username%\%%i && xcopy /Y /S /E /H dotfiles\%%i C:\msys64\home\%username%\%%i
FOR /F %%i in ('DIR /B /A:HD dotfiles') DO mkdir C:\msys64\home\%username%\%%i && xcopy /Y /S /E /H dotfiles\%%i C:\msys64\home\%username%\%%i
FOR /F %%i in ('DIR /B  dotfiles') DO xcopy /Y /H dotfiles\%%i C:\msys64\home\%username%
FOR /F %%i in ('DIR /B /A:H dotfiles') DO xcopy /Y /H dotfiles\%%i C:\msys64\home\%username%
