@echo off
if "%1"=="" goto loop
copy phone%1.in phone.in >nul
echo Problem Test
echo Data %1
time<enter
phone
time<enter
copy phone%1.out phone.out1
check
del phone.in
del phone.out
pause
goto end
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9) do call %0 %%i
:end
