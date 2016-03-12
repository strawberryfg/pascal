var p1,p2:array[1..100] of longint;
    g:array[1..100,1..100] of longint;
    a,b,i,j,n,m:longint;
    d:array[1..100] of boolean;
procedure f1(i:longint);
var j:longint;
begin
if p1[i]=0 then
begin
for j:=1 to n do
    if g[i,j]=1 then begin dec(p1[j]);f1(j);end;
end;
end;
procedure f2(i:longint);
var j:longint;
begin
if p2[i]=0 then
begin
for j:=1 to n do
    if g[j,i]=1 then begin dec(p2[j]);f2(j);end;
end;
end;
begin
assign(input,'message.in');reset(input);
assign(output,'message.out');rewrite(output);
read(n,m);
for i:=1 to m do
    begin
    readln(a,b);
    g[a,b]:=1;
    inc(p2[a]);
    inc(p1[b]);
    end;
for i:=1 to n do
    if p1[i]=0 then f1(i);
for i:=1 to n do
    if p2[i]=0 then f2(i);
for i:=1 to n do
    if (p1[i]<>0)and(p2[i]<>0) then writeln('T')
               else writeln('F');
close(input);
close(output);
end.
