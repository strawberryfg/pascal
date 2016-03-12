@echo off
if "%1"=="" goto loop
copy word%1.in word.in >nul
echo Problem Test
echo Data %1
word>word.out
fc word.out word%1.out
del word.in
del word.out
pause
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
