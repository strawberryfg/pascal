@echo off
if "%1"=="" goto loop
copy kolone%1.in kolone.in >nul
echo Problem Test
echo Data %1
time<enter
kolone
time<enter
fc kolone.out kolone%1.out
del kolone.in
del kolone.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
