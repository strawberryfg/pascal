@echo off
if "%1"=="" goto loop
copy base%1.in base.in >nul
echo Problem Test
echo Data %1
time<enter
base.exe
time<enter
fc base.out base%1.out
del base.in
del base.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
