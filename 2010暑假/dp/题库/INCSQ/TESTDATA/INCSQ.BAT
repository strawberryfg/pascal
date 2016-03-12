@echo off
if "%1"=="" goto loop
copy incsq%1.in incsq.in >nul
echo Problem Test
echo Data %1
time<enter
incsq
time<enter
fc incsq.out incsq%1.out
del incsq.in
del incsq.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
