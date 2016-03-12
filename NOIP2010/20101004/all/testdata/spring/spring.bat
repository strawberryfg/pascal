@echo off
if "%1"=="" goto loop
copy spring%1.in spring.in >nul
echo Problem Test
echo Data %1
time<enter
spring.exe
time<enter
copy spring%1.out spring.ans >nul
fc spring.out spring.ans
del spring.in
del spring.out
del spring.ans
pause
goto quit
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:quit
