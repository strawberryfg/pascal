@echo off
if "%1"=="" goto loop
echo Problem Test
echo Data %1
buses<buses%1.in>buses.out
fc buses.out buses%1.out
del buses.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7) do call %0 %%i
:end
