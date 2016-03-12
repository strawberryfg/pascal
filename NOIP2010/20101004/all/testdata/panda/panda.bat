@echo off
if "%1"=="" goto loop
copy panda%1.in panda.in >nul
echo Problem Test
echo Data %1
time<enter
panda.exe
time<enter
copy panda%1.out panda.ans >nul
fc panda.out panda.ans
del panda.in
del panda.out
del panda.ans
pause
goto quit
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:quit
