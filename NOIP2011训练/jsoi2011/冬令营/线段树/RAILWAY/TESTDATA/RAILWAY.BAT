@echo off
if "%1"=="" goto loop
copy railway%1.in railway.in >nul
echo Problem Test
echo Data %1
time<enter
railway
time<enter
fc railway.out railway%1.out
del railway.in
del railway.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10 11 12) do call %0 %%i
:end
