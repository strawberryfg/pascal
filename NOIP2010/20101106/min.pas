var i,n,m,j,a,b,len,t:longint;
    two:array[0..100]of longint;
    d:array[1..100000]of longint;
    f,ans:array[1..100000,0..100]of longint;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
function check(a,b:longint):longint;
var i,num:longint;
begin
num:=b-a+1;
for i:=0 to 20 do
    begin
    if (num>=two[i])and(num<two[i+1]) then exit(i);
    end;
end;
begin
assign(input,'min.in');
reset(input);
readln(n,m);
for i:=1 to n do read(d[i]);
two[0]:=1;
for i:=1 to 20 do two[i]:=two[i-1]*2;
for i:=1 to n do f[i,0]:=d[i];
t:=check(1,n);
for j:=1 to t do
    begin
    for i:=1 to n+1-j do
        begin
        f[i,j]:=min(f[i,j-1],f[i+two[j-1],j-1]);
        end;
    end;
for i:=1 to m do
    begin
    readln(a,b);
    len:=check(a,b);
    ans[a,b]:=min(f[a,len],f[b-two[len]+1,len]);
    writeln(ans[a,b]);
    end;
close(input);
end.
