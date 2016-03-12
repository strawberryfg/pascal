@echo off
if "%1"=="" goto loop
copy add%1.in add.in >nul
echo Problem Test
echo Data %1
time<enter
add
time<enter
fc add.out add%1.out
del add.in
del add.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
