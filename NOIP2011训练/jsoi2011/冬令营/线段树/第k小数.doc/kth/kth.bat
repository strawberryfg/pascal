@echo off
if "%1"=="" goto loop
copy kth%1.in kth.in >nul
echo Problem Test
echo Data %1
time<enter
kth
time<enter
fc kth.out kth%1.out
del kth.in
del kth.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
