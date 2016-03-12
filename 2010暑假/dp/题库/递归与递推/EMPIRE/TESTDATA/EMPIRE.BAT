@echo off
if "%1"=="" goto loop
copy empire%1.in empire.in >nul
echo Problem Test
echo Data %1
time<enter
empire
time<enter
fc empire.out empire%1.out
pause
del empire.in
del empire.out
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
