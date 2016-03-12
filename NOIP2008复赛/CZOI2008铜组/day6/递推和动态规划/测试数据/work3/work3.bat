@echo off
if "%1"=="" goto loop
copy work3_%1.in work3.in >nul
echo Problem Test
echo Aata %1
time<enter
work3
time<enter
fc work3.out work3_%1.out
del work3.in
del work3.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end