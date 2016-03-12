@echo off
if "%1"=="" goto loop
copy bracket%1.in bracket.in >nul
echo Problem Test Data %1
time<enter
bracket
time<enter
fc bracket.out bracket%1.out
copy bracket%1.out bracket.ans >nul
check
del bracket.in
del bracket.out
del bracket.ans
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10 11 12 13) do call %0 %%i
:end
