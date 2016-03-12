@echo off
if "%1"=="" goto loop
copy work2_%1.in work2.in >nul
echo Problem Test
echo Aata %1
time<enter
work2
time<enter
fc work2.out work2_%1.out
del work2.in
del work2.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end