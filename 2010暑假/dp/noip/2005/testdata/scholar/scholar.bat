@echo off
if "%1"=="" goto loop
copy scholar%1.in scholar.in >nul
echo Problem Test
echo Data %1
time<enter
scholar
time<enter
fc scholar.out scholar%1.out
del scholar.in
del scholar.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
