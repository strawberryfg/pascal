@echo off
if "%1"=="" goto loop
copy stair%1.in stair.in >nul
echo Problem Test
echo Data %1
time<enter
stair
time<enter
fc stair.out stair%1.out
del stair.in
del stair.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
