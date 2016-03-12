@echo off
if "%1"=="" goto loop
copy josephus%1.in josephus.in >nul
echo Problem Test
echo Data %1
time<enter
josephus
time<enter
fc josephus.out josephus%1.out
del josephus.in
del josephus.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
