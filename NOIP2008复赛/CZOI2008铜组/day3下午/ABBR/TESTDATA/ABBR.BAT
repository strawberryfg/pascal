@echo off
if "%1"=="" goto loop
copy abbr%1.in abbr.in >nul
echo Problem Test
echo Data %1
time<enter
abbr
time<enter
fc abbr.out abbr%1.out
del abbr.in
del abbr.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
