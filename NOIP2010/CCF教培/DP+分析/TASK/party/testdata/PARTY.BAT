@echo off
if "%1"=="" goto loop
copy party%1.in party.in >nul
echo Problem Test
echo Data %1
time<enter
party
time<enter
fc party.out party%1.out
del party.in
del party.out
pause
goto end
:loop
for %%i in (1 2 3 4) do call %0 %%i
:end
