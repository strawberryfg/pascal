@echo off
if "%1"=="" goto loop
copy broj%1.in broj.in >nul
echo Problem Test
echo Data %1
time<enter
broj
time<enter
fc broj.out broj%1.ou
del broj.in
del broj.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
