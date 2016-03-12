@echo off
if "%1"=="" goto loop
copy bus%1.in bus.in >nul
echo Problem Test
echo Data %1
time<enter
bus
time<enter
fc bus.out bus%1.out
del bus.in
del bus.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
