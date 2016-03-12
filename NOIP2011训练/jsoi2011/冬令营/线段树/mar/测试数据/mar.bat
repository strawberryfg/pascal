@echo off
if "%1"=="" goto loop
echo Problem Mars Maps
echo Data %1
copy mar%1.in mar.in >nul
mar
fc mar%1.out mar.out
pause
goto end
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
