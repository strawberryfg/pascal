@echo off
if "%1"=="" goto loop
copy cross%1.in cross.in >nul
echo Problem Test
echo Data %1
time<enter
cross.exe
time<enter
fc cross.out cross%1.out
del cross.in
del cross.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
