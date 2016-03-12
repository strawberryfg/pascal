@echo off
if "%1"=="" goto loop
copy teststr%1.in teststr.in >nul
echo Problem Test
echo Data %1
time<enter
teststr
time<enter
fc teststr.out teststr%1.out
del teststr.in
del teststr.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
