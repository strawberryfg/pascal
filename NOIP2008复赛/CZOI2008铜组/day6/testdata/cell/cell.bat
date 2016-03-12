@echo off
if "%1"=="" goto loop
copy cell%1.in cell.in >nul
echo Problem Test
echo Data %1
time<enter
cell
time<enter
fc cell.out cell%1.out
del cell.in
del cell.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
