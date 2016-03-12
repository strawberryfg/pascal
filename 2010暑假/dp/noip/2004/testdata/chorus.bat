@echo off
if "%1"=="" goto loop
copy chorus\chorus%1.in chorus.in >nul
echo Problem Test
echo Data %1
time<enter
chorus
time<enter
fc chorus.out chorus\chorus%1.ans
del chorus.in
del chorus.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
