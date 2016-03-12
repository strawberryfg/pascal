@echo off
if "%1"=="" goto loop
copy unhappy\unhappy%1.in unhappy.in >nul
echo Problem Test
echo Data %1
time<enter
unhappy
time<enter
fc unhappy.out unhappy\unhappy%1.ans
del unhappy.in
del unhappy.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
