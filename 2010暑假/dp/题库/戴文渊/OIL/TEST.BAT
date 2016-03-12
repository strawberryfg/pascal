@echo off
if "%1"=="" goto loop
copy oil%1.in oil.in >nul
echo Problem Test
echo Data %1
oil>oil.out
fc oil.out oil%1.out
del oil.in
del oil.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
