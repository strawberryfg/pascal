var m,n,i,j,k,l,now:longint;
    a,b:array[1..60,1..60]of longint;
    s:array[1..60]of string;
procedure solve(x,y:longint);
begin
b[x,y]:=l;
if (x-1>=1) then if b[x-1,y]=0 then solve(x-1,y);
if (y+1<=n) then if b[x,y+1]=0 then solve(x,y+1);
if (x+1<=n) then if b[x+1,y]=0 then solve(x+1,y);
if (y-1>=1) then if b[x,y-1]=0 then solve(x,y-1);
end;
begin
assign(input,'cell.in');
assign(output,'cell.out');
reset(input);
rewrite(output);
reset(input);
readln(m,n);
fillchar(a,sizeof(a),0);
fillchar(b,sizeof(b),0);
for i:=1 to m do
    begin
    readln(s[i]);
    for j:=1 to n do
        begin
        a[i,j]:=ord(s[i][j])-48;
        if a[i,j]=0 then b[i,j]:=-1;
        end;
    end;
l:=0;
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        if b[i,j]=0 then begin inc(l);solve(i,j); end;
        end;
    end;
writeln(l);
close(input);
close(output);
end.
