@echo off
if "%1"=="" goto loop
copy str%1.in str.in >nul
echo Problem Test
echo Data %1
time<enter
str.exe
time<enter
fc str.out str%1.out
del str.in
del str.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6) do call %0 %%i
:end
