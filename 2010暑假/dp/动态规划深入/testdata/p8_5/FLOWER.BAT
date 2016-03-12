@echo off
if "%1"=="" goto loop
copy flower%1.inp flower.inp >nul
echo Problem Test
echo Data %1
time<enter
flower
time<enter
fc flower.out flower%1.ans
del flower.inp
del flower.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
