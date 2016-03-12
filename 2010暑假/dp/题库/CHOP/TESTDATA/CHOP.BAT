@echo off
if "%1"=="" goto loop
copy chop%1.in chop.in >nul
echo Problem Test
echo Data %1
time<enter
chop
time<enter
fc chop.out chop%1.out
del chop.in
del chop.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
