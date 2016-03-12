@echo off
if "%1"=="" goto loop
copy stone%1.in stone.in >nul
echo Problem Test
echo Data %1
time<enter
stone
time<enter
fc stone.out stone%1.out
del stone.in
del stone.out
pause
goto end
:loop
for %%i in (1 2 3) do call %0 %%i
:end
