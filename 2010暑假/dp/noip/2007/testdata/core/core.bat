@echo off
if "%1"=="" goto loop
copy core%1.in core.in >nul
echo Problem Test
echo Data %1
time<enter
core.exe
time<enter
fc core.out core%1.out
del core.in
del core.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
