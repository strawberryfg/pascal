@echo off
if "%1"=="" goto loop
copy engzam%1.in engzam.in >nul
echo Problem Test
echo Data %1
time<enter
engzam.exe
time<enter
fc engzam.out engzam%1.out
del engzam.in
del engzam.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
