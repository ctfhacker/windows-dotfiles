rem ConEmuSetup.160619.exe
rem msys2-x86_64-20160205.exe
rem gvim74.exe
rem reg import ConEmu.reg
FOR /F %%i in ('DIR /B /A:D dotfiles') DO mkdir C:\msys64\home\%username%\%%i && xcopy /Y /S /E /H dotfiles\%%i C:\msys64\home\%username%\%%i
FOR /F %%i in ('DIR /B /A:HD dotfiles') DO mkdir C:\msys64\home\%username%\%%i && xcopy /Y /S /E /H dotfiles\%%i C:\msys64\home\%username%\%%i
FOR /F %%i in ('DIR /B  dotfiles') DO xcopy /Y /H dotfiles\%%i C:\msys64\home\%username%
FOR /F %%i in ('DIR /B /A:H dotfiles') DO xcopy /Y /H dotfiles\%%i C:\msys64\home\%username%
