@echo off
if "%1"=="" goto loop
copy digital%1.in digital.in >nul
echo Problem Test
echo Data %1
time<enter
digital
time<enter
fc digital.out digital%1.out
del digital.in
del digital.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
