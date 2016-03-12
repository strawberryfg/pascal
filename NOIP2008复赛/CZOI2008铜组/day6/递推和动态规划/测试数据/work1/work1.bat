@echo off
if "%1"=="" goto loop
copy work1_%1.in work1.in >nul
echo Problem Test
echo Aata %1
time<enter
work1
time<enter
fc work1.out work1_%1.out
del work1.in
del work1.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end