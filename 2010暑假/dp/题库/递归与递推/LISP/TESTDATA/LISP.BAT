@echo off
if "%1"=="" goto loop
copy lisp%1.in lisp.in >nul
echo Problem Test
echo Data %1
time<enter
lisp
time<enter
fc lisp.out lisp%1.out
del lisp.in
del lisp.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
