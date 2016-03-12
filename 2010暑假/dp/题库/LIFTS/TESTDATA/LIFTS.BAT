@echo off
if "%1"=="" goto loop
copy lifts%1.in lifts.in >nul
echo Problem Test
echo Data %1
time<enter
lifts
time<enter
fc lifts.out lifts%1.out
del lifts.in
del lifts.out
pause
goto end
:loop
for %%i in (1 2 3 4) do call %0 %%i
:end
