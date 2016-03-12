@echo off
if "%1"=="" goto loop
copy work4_%1.in work4.in >nul
echo Problem Test
echo Aata %1
time<enter
work4
time<enter
fc work4.out work4_%1.out
del work4.in
del work4.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end