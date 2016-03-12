@echo off
if "%1"=="" goto loop
copy knight%1.in knight.in > nul
copy knight%1.ans knight.ans > nul
echo Problem knight
echo Data %1
time < enter
knight
time < enter
knight_chk
pause
del knight.in
del knight.out
del knight.ans
goto end
:loop
for %%i in (1 2 3 4 5) do call %0 %%i
:end
