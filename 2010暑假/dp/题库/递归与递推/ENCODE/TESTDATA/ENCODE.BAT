@echo off
if "%1"=="" goto loop
copy encode%1.in encode.in >nul
echo Problem Test
echo Data %1
time<enter
encode
time<enter
fc encode.out encode%1.out
del encode.in
del encode.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
