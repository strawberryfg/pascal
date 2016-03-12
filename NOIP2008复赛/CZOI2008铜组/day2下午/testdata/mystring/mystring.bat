@echo off
if "%1"=="" goto loop
copy mystring%1.in mystring.in >nul
echo Problem Test
echo Data %1
time<enter
mystring.exe
time<enter
fc mystring.out mystring%1.out
del mystring.in
del mystring.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
