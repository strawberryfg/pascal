@echo off
if "%1"=="" goto loop
copy jsp%1.in jsp.in >nul
echo Problem Test
echo Data %1
time<enter
jsp
time<enter
fc jsp.out jsp%1.out
del jsp.in
del jsp.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
