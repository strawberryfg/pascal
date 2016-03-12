@echo off
if "%1"=="" goto loop
copy charcom%1.in charcom.in >nul
echo Problem Test
echo Data %1
time<enter
charcom
time<enter
fc charcom.out charcom%1.out
del charcom.in
del charcom.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
