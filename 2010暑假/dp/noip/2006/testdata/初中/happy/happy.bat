@echo off
if "%1"=="" goto loop
copy happy%1.in happy.in >nul
echo Problem Test
echo Data %1
time<enter
happy
time<enter
fc happy.out happy%1.out
del happy.in
del happy.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
