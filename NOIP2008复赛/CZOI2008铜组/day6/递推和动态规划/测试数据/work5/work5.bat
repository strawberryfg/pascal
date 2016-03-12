@echo off
if "%1"=="" goto loop
copy work5_%1.in work5.in >nul
echo Problem Test
echo Aata %1
time<enter
work5
time<enter
fc work5.out work5_%1.out
del work5.in
del work5.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end