@echo off
if "%1"=="" goto loop
copy sort%1.in sort.in >nul
echo Problem Test
echo
Data %1
time<enter
sort
time<enter
fc sort.out sort%1.out
del sort.in
del sort.out
pause
goto end
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9) do call %0 %%i
:end
