@echo off
if "%1"=="" goto loop
copy stables%1.in stables.in >nul
echo Problem Test
echo Data %1
time<enter
stables
time<enter
fc stables.out stables%1.out
del stables.in
del stables.out
pause
goto end
:loop
for %%i in (1 2 3 4) do call %0 %%i
:end
