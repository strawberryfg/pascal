@echo off
if "%1"=="" goto loop
copy maxnum%1.in maxnum.in >nul
echo Problem Test
echo Data %1
time<enter
maxnum.exe
time<enter
fc maxnum.out maxnum%1.out
del maxnum.in
del maxnum.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
