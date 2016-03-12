@echo off
if "%1"=="" goto loop
copy percal%1.in percal.in >nul
echo Problem Test Data %1
time<enter
percal
time<enter
fc percal.out percal%1.out
del percal.in
del percal.out
pause
goto end
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) do call %0 %%i
:end
