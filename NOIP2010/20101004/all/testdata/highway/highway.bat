@echo off
if "%1"=="" goto loop
copy highway%1.in highway.in >nul
echo Problem Test
echo Data %1
time<enter
highway.exe
time<enter
copy highway%1.out highway.ans >nul
fc highway.out highway.ans
del highway.in
del highway.out
del highway.ans
pause
goto quit
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:quit
