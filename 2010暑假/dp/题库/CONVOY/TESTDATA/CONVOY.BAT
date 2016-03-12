@echo off
if "%1"=="" goto loop
copy convoy%1.in convoy.in >nul
echo Problem Test
echo Data %1
time<enter
convoy
time<enter
fc convoy.out convoy%1.out
del convoy.in
del convoy.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
