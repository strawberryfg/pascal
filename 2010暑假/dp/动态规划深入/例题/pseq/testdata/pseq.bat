@echo off
if "%1"=="" goto loop
copy pseq%1.in pseq.in >nul
echo Problem Test
echo Data %1
time<enter
pseq
time<enter
fc pseq.out pseq%1.out
del pseq.in
del pseq.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
