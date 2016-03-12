@echo off
if "%1"=="" goto loop
copy knum%1.in knum.in >nul
echo Problem Test
echo Data %1
time<enter
knum.exe
time<enter
fc knum.out knum%1.out
del knum.in
del knum.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
