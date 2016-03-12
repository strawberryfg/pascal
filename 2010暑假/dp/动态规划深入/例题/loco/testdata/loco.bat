@echo off
if "%1"=="" goto loop
copy loco%1.in loco.in >nul
echo Problem Test
echo Data %1
time<enter
loco
time<enter
fc loco.out loco%1.out
del loco.in
del loco.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7) do call %0 %%i
:end
