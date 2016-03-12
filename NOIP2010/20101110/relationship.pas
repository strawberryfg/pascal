const maxn=220;
var n,m1,m2,x,y,i,j,k,cnt,p:longint;
    f:array[1..maxn,1..maxn,0..1]of longint;
function check(a,b,c,x,y:longint):boolean;
begin
if (f[a,b,x]=1) then
   begin
   if (f[b,c,y]=1) then
      exit(true);
   end;
exit(false);
end;
begin
assign(input,'relationship.in');
reset(input);
assign(output,'relationship.out');
rewrite(output);
readln(n,m1,m2);
for i:=1 to m1 do
    begin
    readln(x,y);
    f[x,y,1]:=1;
    end;
for i:=1 to m2 do
    begin
    readln(x,y);
    f[x,y,0]:=1;
    end;
//0:hate 1:like;
for p:=1 to 10 do
begin
for k:=1 to n do
    for i:=1 to n do
        if i<>k then
        for j:=1 to n do
            begin
            if (i<>j)and(j<>k) then
               begin
               if check(i,k,j,0,1) then f[i,j,0]:=1;
               if check(i,k,j,0,0) then f[i,j,1]:=1;
               if check(i,k,j,1,0) then f[i,j,0]:=1;
               if check(i,k,j,1,1) then f[i,j,0]:=1;
               end;
            end;
end;
cnt:=0;
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        if i=j then continue;
        if (f[i,j,1]=1)then begin {writeln(i,' ',j);} inc(cnt); end;
        if (f[i,j,0]=1) then begin {writeln(i,' ',j);} inc(cnt); end;
        end;
    end;
writeln(cnt);
close(input);
close(output);
end.