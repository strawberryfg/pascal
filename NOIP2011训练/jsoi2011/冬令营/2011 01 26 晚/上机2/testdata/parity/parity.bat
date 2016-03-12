@echo off
if "%1"=="" goto loop
copy parity%1.in parity.in >nul
echo Problem Test
echo Data %1
time<enter
parity.exe
time<enter
fc parity.out parity%1.out
del parity.in
del parity.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
