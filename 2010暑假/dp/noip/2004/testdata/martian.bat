@echo off
if "%1"=="" goto loop
copy martian\martian%1.in martian.in >nul
echo Problem Test
echo Data %1
time<enter
martian
time<enter
fc martian.out martian\martian%1.ans
del martian.in
del martian.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
