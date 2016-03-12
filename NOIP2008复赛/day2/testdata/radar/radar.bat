@echo off
if "%1"=="" goto loop
copy radar%1.in radar.in >nul
echo Problem Test
echo Data %1
time<enter
radar.exe
time<enter
fc radar.out radar%1.out
del radar.in
del radar.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
