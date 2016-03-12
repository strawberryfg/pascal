@echo off
if "%1"=="" goto loop
copy Argus%1.in Argus.in >nul
echo Problem Test
echo Data %1
time<enter
Argus.exe
time<enter
fc Argus.out Argus%1.out
del Argus.in
del Argus.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
