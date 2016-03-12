@echo off
if "%1"=="" goto loop
copy bigexp%1.in bigexp.in >nul
echo Problem Test
echo Data %1
time<enter
bigexp
time<enter
fc bigexp.out bigexp%1.out
del bigexp.in
del bigexp.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
