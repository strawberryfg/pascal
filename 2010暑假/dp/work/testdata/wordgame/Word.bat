@echo off
if "%1"=="" goto loop
copy Word%1.in Word.in >nul
echo Problem Test
echo Data %1
time<enter
Word.exe
time<enter
fc Word.out Word%1.out
del Word.in
del Word.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
