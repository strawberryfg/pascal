@echo off
if "%1"=="" goto loop
copy mul%1.in mul.in >nul
echo Problem Test
echo Data %1
time<enter
mul
time<enter
fc mul.out mul%1.out
del mul.in
del mul.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
