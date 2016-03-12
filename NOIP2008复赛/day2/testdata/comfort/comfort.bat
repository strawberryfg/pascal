@echo off
if "%1"=="" goto loop
copy comfort%1.in comfort.in >nul
echo Problem Test
echo Data %1
time<enter
comfort.exe
time<enter
fc comfort.out comfort%1.out
del comfort.in
del comfort.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
