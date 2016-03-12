@echo off
if "%1"=="" goto loop
copy fire%1.in fire.in >nul
echo Problem Test
echo Data %1
time<enter
fire
time<enter
fc fire.out fire%1.out
del fire.in
del fire.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
