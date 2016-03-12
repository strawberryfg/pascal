@echo off
if "%1"=="" goto loop
copy palin%1.in palin.in >nul
echo Problem Test
echo Data %1
time<enter
palin
time<enter
fc palin.out palin%1.ans
del palin.in
del palin.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
