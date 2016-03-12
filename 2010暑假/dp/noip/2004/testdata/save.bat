@echo off
if "%1"=="" goto loop
copy save\save%1.in save.in >nul
echo Problem Test
echo Data %1
time<enter
save
time<enter
fc save.out save\save%1.ans
del save.in
del save.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
