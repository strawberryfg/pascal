@echo off
if "%1"=="" goto loop
copy function%1.in function.in >nul
echo Problem Test
echo Data %1
time<enter
function.exe
time<enter
fc function.out function%1.out
del function.in
del function.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
