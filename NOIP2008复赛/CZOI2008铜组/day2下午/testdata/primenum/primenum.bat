@echo off
if "%1"=="" goto loop
copy primenum%1.in primenum.in >nul
echo Problem Test
echo Data %1
time<enter
primenum.exe
time<enter
fc primenum.out primenum%1.out
del primenum.in
del primenum.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
