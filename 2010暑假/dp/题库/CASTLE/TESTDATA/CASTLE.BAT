@echo off
if "%1"=="" goto loop
copy castle%1.in castle.in >nul
echo Problem Test
echo Data %1
time<enter
castle
time<enter
fc castle.out castle%1.out
del castle.in
del castle.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 0) do call %0 %%i
:end
