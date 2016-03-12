@echo off
if "%1"=="" goto loop
copy prime%1.in prime.in >nul
echo Problem Test
echo Data %1
time <enter
prime
time <enter
fc prime.out prime%1.out
del prime.in
del prime.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
