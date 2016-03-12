var n,m,i,j,t:longint;
    s:array[1..500000] of char;
    a:array[1..500000] of longint;
procedure change(x,y:longint);
var p:char;
    q:longint;
begin
p:=s[x]; s[x]:=s[y]; s[y]:=p;
q:=a[x]; a[x]:=a[y]; a[y]:=q;
end;
begin
assign(input,'kolone.in');
reset(input);
assign(output,'kolone.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    read(s[n-i+1]);
readln;
for i:=1 to m do
    read(s[n+i]);
readln;
for i:=1 to n do
    a[i]:=1;
for j:=1 to m do
    a[j+n]:=2;
read(t);
for i:=1 to t do
    begin
    j:=1;
    while j<n+m do
    if (a[j]=1) and (a[j+1]=2) then begin change(j,j+1); j:=j+2; end
                               else inc(j);
    end;
for i:=1 to n+m do
    write(s[i]);
writeln;
close(input);
close(output);
end.
