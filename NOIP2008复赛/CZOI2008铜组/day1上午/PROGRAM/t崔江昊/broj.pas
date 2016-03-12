var n,i,a,t:longint;   s:int64;
begin
readln(n);
a:=1;
t:=n;
while t div 10>0 do begin a:=a+1; t:=t div 10; end;
s:=0;
if n<=9 then begin writeln(n); close(input); close(output);halt; end;
if n<=99 then begin s:=s+9+(n-9)*2; writeln(s);close(input); close(output); halt; end;
s:=s+9;
n:=n-9;
t:=1;
for i:=2 to a-1 do
   begin
   t:=t*10;
   s:=s+t*9*i;
   n:=n-t*9;
   end;
   s:=s+n*a;
   writeln(s);
end.