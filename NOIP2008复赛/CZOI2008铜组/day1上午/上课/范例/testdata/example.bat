@echo off
if "%1"=="" goto loop
copy example%1.in example.in >nul
echo Problem Test
echo Data %1
time<enter
example.exe
time<enter
fc example.out example%1.out
del example.in
del example.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
