@echo off
if "%1"=="" goto loop
copy divide%1.in divide.in >nul
echo Problem Test
echo Data %1
time<enter
divide.exe
time<enter
fc divide.out divide%1.out
del divide.in
del divide.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
