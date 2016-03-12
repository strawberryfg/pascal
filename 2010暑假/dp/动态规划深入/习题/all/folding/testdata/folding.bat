@echo off
if "%1"=="" goto loop
copy folding%1.in folding.in >nul
echo Problem Test
echo Data %1
time<enter
folding
time<enter
fc folding.out folding%1.out
del folding.in
del folding.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
