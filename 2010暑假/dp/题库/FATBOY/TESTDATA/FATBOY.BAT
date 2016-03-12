@echo off
if "%1"=="" goto loop
copy fatboy%1.in fatboy.in >nul
echo Problem Test
echo Data %1
time<enter
fatboy
time<enter
fc fatboy.out fatboy%1.out
del fatboy.in
del fatboy.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
