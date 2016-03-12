@echo off
if "%1"=="" goto loop
copy maximizer%1.in Maximizer.in >nul
echo Problem Test
echo Data %1
time<enter
Maximizer
time<enter
fc Maximizer.out maximizer%1.out
pause
del Maximizer.in
del Maximizer.out
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18) do call %0 %%i
:end
