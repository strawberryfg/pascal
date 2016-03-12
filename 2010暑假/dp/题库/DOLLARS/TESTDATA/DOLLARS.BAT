@echo off
if "%1"=="" goto loop
copy dollars%1.in dollars.in >nul
echo Problem Test
echo Data %1
time<enter
dollars
time<enter
fc dollars.out dollars%1.out
del dollars.in
del dollars.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
