@echo off
if "%1"=="" goto loop
copy subset%1.in subset.in >nul
echo Problem Test
echo Data %1
time<enter
subset
time<enter
fc subset.out subset%1.out
del subset.in
del subset.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
