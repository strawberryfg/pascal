@echo off
if "%1"=="" goto loop
copy post%1.in post.in >nul
echo Problem Test
echo Data %1
time<enter
post
time<enter
fc post.out post%1.out
del post.in
del post.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
