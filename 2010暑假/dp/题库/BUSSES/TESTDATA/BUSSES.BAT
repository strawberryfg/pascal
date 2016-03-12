@echo off
if "%1"=="" goto loop
copy busses%1.in busses.in >nul
echo Problem Test
echo Data %1
time<enter
busses
time<enter
fc busses.out busses%1.out
del busses.in
del busses.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7) do call %0 %%i
:end
