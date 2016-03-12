@echo off
if "%1"=="" goto loop
copy align%1.in align.in >nul
echo Problem Test
echo Data %1
time<enter
align
time<enter
fc align.out align%1.out
del align.in
del align.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
