@echo off
if "%1"=="" goto loop
copy rocks%1.in rocks.in >nul
echo Problem Test
echo Data %1
time<enter
rocks
time<enter
fc rocks.out rocks%1.out
del rocks.in
del rocks.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
