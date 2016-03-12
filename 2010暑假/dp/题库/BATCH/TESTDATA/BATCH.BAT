@echo off
if "%1"=="" goto loop
copy batch%1.in batch.in >nul
echo Problem Test
echo Data %1
time<enter
batch
time<enter
fc batch.out batch%1.out
del batch.in
del batch.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
