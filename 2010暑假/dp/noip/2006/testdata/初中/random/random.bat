@echo off
if "%1"=="" goto loop
copy random%1.in random.in >nul
echo Problem Test
echo Data %1
time<enter
random
time<enter
fc random.out random%1.out
del random.in
del random.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
