@echo off
if "%1"=="" goto loop
copy sequence%1.in sequence.in >nul
echo Problem Test
echo Data %1
time<enter
sequence
time<enter
fc sequence.out sequence%1.out
del sequence.in
del sequence.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
