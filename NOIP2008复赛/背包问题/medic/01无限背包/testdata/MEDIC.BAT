@echo off
if "%1"=="" goto loop
copy medic%1.in medic.in >nul
echo Problem Test
echo Data %1
time<enter
medic
time<enter
fc medic.out medic%1.out
del medic.in
del medic.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
