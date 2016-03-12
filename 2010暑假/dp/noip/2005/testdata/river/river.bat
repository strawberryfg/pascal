@echo off
if "%1"=="" goto loop
copy river%1.in river.in >nul
echo Problem Test
echo Data %1
time<enter
river
time<enter
fc river.out river%1.out
del river.in
del river.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
