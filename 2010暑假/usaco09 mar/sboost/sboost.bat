@echo off
if "%1"=="" goto loop
copy sboost%1.in sboost.in >nul
echo Problem Test
echo Data %1
time<enter
sboost
time<enter
fc sboost.out sboost%1.out
del sboost.in
del sboost.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
