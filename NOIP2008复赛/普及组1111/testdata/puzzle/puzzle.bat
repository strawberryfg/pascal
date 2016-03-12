@echo off
if "%1"=="" goto loop
copy puzzle%1.in puzzle.in >nul
echo Problem Test
echo Data %1
time <enter
puzzle
time <enter
fc puzzle.out puzzle%1.out
del puzzle.in
del puzzle.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
