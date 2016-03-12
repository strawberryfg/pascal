var i,j,n,t,min:longint;
    a,f,p,fu,fd:array[1..101]of longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n do read(a[i]);
for i:=1 to n do begin fu[i]:=1;fd[i]:=1; end;
for i:=2 to n do
    for j:=1 to i-1 do
        if a[i]>a[j] then if fu[j]+1>fu[i] then fu[i]:=fu[j]+1;
for i:=n-1 downto 1 do
    for j:=i+1 to n do
        if a[i]>a[j] then if fd[j]+1>fd[i] then fd[i]:=fd[j]+1;
min:=maxlongint;
for i:=1 to n do if n-(fd[i]+fu[i]-1)<min then min:=n-(fd[i]+fu[i]-1);
writeln(min);
close(input);
close(output);
end.