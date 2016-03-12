@echo off
if "%1"=="" goto loop
copy krunch%1.in krunch.in >nul
echo Problem Test
echo Data %1
krunch
fc krunch.out krunch%1.out
del krunch.in
del krunch.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10 11 12 13) do call %0 %%i
:end
