@echo off
if "%1"=="" goto loop
copy apples%1.in apples.in >nul
echo Problem Test
echo Data %1
time<enter
apples
time<enter
fc apples.out apples%1.out
del apples.in
del apples.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8) do call %0 %%i
:end
