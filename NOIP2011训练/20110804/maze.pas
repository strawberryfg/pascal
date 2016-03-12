const dx:array[1..4]of longint=(-1,1,0,0);
      dy:array[1..4]of longint=(0,0,-1,1);
var n,i:longint;
    row,col,r,c:array[1..10]of longint;
    pd:boolean;
    spe:array[1..4]of char;
    hash:array[1..10,1..10]of longint;
    f:array[1..40]of longint;
procedure print(x:longint);
var i:longint;
begin
for i:=1 to n do
    begin
    if (row[i]<>r[i])or(col[i]<>c[i]) then exit;
    end;
for i:=1 to x do
    begin
    write(spe[f[i]]);
    end;
writeln;
pd:=true;
end;
procedure dfs(x,y,dep:longint);
var i,tx,ty:longint;
begin
if (x=n)and(y=n) then begin print(dep-1); exit; end;
for i:=1 to 4 do
    begin
    tx:=x+dx[i]; ty:=y+dy[i];
    if (tx<=0)or(tx>n)or(ty<=0)or(ty>n) then continue;
    if hash[tx,ty]=0 then
       begin
       if (c[ty]+1<=col[ty])and(r[tx]+1<=row[tx]) then
          begin
          hash[tx,ty]:=1;
          inc(c[ty]);
          inc(r[tx]);
          f[dep]:=i;
          dfs(tx,ty,dep+1);
          if pd then exit;
          hash[tx,ty]:=0;
          dec(c[ty]);
          dec(r[tx]);
          f[dep]:=0;
          end;
       end;
    end;
end;
begin
assign(input,'maze.in');
reset(input);
assign(output,'maze.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(col[i]);
    end;
for i:=1 to n do
    begin
    read(row[i]);
    end;
spe[1]:='D'; spe[2]:='U'; spe[3]:='L'; spe[4]:='R';
pd:=false;
hash[1,1]:=1;
r[1]:=1;
c[1]:=1;
dfs(1,1,1);
if not pd then writeln('NO ANSWER');
close(input);
close(output);
end.
