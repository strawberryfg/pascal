var n,m,x,y,i,time,sum:longint;
    colour,d,f,father:array[1..100]of longint;
    edge:array[1..100,0..100]of longint;
procedure visit(p:longint);
var i:longint;
begin
colour[p]:=2;//grey;
inc(time);
d[p]:=time;
for i:=1 to edge[p,0] do
    begin
    if colour[edge[p,i]]=1 then
       begin
       father[edge[p,i]]:=p;
       visit(edge[p,i]);
       end;
    end;
colour[p]:=3;
inc(time);
f[p]:=time;
end;
procedure dfs;
var i:longint;
begin
for i:=1 to n do
    begin
    colour[i]:=1;  //white
    end;
time:=0;
for i:=1 to n do
    begin
    if colour[i]=1 then
       begin
       inc(sum);
       visit(i);
       end;
    end;
end;
begin
assign(input,'tulun.in');
reset(input);
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    end;
dfs;
for i:=1 to n do write(d[i],' ');
writeln;
writeln(sum);
close(input);
end.
