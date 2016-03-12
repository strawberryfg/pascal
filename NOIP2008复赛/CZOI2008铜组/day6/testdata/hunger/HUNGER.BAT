@echo off
if "%1"=="" goto loop
copy hunger%1.in hunger.in >nul
echo Problem Test
echo Data %1
time<enter
hunger
time<enter
fc hunger.out hunger%1.out
del hunger.in
del hunger.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
