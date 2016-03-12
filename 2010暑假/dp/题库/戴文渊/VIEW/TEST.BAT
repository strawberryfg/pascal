@echo off
if "%1"=="" goto loop
echo Problem Test
echo Data %1
view<view%1.in>view.out
fc view.out view%1.out
del view.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
