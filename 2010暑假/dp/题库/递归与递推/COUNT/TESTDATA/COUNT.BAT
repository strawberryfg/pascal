@echo off
if "%1"=="" goto loop
copy count%1.in count.in >nul
echo Problem Test
echo Data %1
time<enter
count
time<enter
fc count.out count%1.out
del count.in
del count.out
pause
goto end
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9) do call %0 %%i
:end
