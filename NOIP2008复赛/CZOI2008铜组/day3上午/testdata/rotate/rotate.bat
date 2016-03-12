@echo off
if "%1"=="" goto loop
copy rotate%1.in rotate.in >nul
echo Problem Test
echo Data %1
time<enter
rotate
time<enter
fc rotate.out rotate%1.out
del rotate.in
del rotate.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
