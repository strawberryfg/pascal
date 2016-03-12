@echo off
if "%1"=="" goto loop
copy natrij%1.in natrij.in >nul
echo Problem Test
echo Data %1
time<enter
natrij
time<enter
fc natrij.out natrij%1.out
del natrij.in
del natrij.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
