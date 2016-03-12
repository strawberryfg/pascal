@echo off
if "%1"=="" goto loop
copy bag%1.in bag.in >nul
echo Problem Test
echo Data %1
time<enter
bag.exe
time<enter
fc bag.out bag%1.out
del bag.in
del bag.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
