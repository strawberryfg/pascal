var f:array[1..230,1..101]of longint;
    m,n,spe,i:longint;
    a:array[0..12]of longint;
    pd:boolean;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
procedure pre;
var i,j,k:longint;
begin
for i:=2 to m do
    begin
    for j:=2 to min(i,n) do
        begin
        for k:=1 to i div j do
            begin
            f[i,j]:=f[i,j]+f[i-(k-1)*j-1,j-1];
            end;
        end;
    end;
end;
procedure print;
var i:longint;
begin
for i:=1 to n-1 do write(a[i],' ');
write(a[n]);
writeln;
end;
procedure dfs(dep,num,k,ind:longint);
var i,sum,t:longint;
begin
if dep=n then
   begin
   a[dep]:=num+(a[dep-1]-1);
   print;
   pd:=true;
   exit;
   end;
sum:=0;
for i:=1 to num div k do
    begin
    t:=f[num-(i-1)*(k-1)-i,k-1];
    if ind+t+sum>=spe then
       begin
       a[dep]:=i+(a[dep-1]-1);
       dfs(dep+1,num-(i-1)*(k-1)-i,k-1,ind+sum);
       break;
       end;
    sum:=sum+t;
    end;
end;
begin
assign(input,'part.in');
reset(input);
assign(output,'part.out');
rewrite(output);
readln(m);
readln(n);
readln(spe);
for i:=1 to m do f[i,1]:=1;
pre;
a[0]:=1;
pd:=false;
dfs(1,m,n,0);
close(input);
close(output);
end.