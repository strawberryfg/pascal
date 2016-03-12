@echo off
if "%1"=="" goto loop
copy fbi\fbi%1.in fbi.in >nul
echo Problem Test
echo Data %1
time<enter
fbi
time<enter
fc fbi.out fbi\fbi%1.ans
del fbi.in
del fbi.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
