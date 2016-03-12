@echo off
if "%1"=="" goto loop
copy interval%1.in interval.in >nul
echo Problem Test
echo Data %1
time<enter
interval
time<enter
fc interval.out interval%1.out
del interval.in
del interval.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
