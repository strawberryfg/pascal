@echo off
if "%1"=="" goto loop
copy peanuts\peanuts%1.in peanuts.in >nul
echo Problem Test
echo Data %1
time<enter
peanuts
time<enter
fc peanuts.out peanuts\peanuts%1.ans
del peanuts.in
del peanuts.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
