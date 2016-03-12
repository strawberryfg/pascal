@echo off
if "%1"=="" goto loop
copy friends%1.in friends.in >nul
echo Problem Test
echo Data %1
time<enter
friends.exe
time<enter
copy friends%1.out friends.ans >nul
fc friends.out friends.ans
del friends.in
del friends.out
del friends.ans
pause
goto quit
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:quit
