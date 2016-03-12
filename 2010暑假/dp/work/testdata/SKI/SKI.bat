@echo off
if "%1"=="" goto loop
copy SKI%1.in SKI.in >nul
echo Problem Test
echo Data %1
time<enter
SKI.exe
time<enter
fc SKI.out SKI%1.out
del SKI.in
del SKI.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
