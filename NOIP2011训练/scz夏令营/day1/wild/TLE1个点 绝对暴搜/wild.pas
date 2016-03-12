 var st:string;
    f:array[1..12]of longint;
    cnt,i,tmp:longint;
    n,sum,num:qword;
procedure dfs(dep:longint);
var i,down:longint;
    now:qword;
begin
if dep>length(st) then
  begin
  now:=0;
  for i:=1 to  length(st) do
      now:=qword(now)*qword(10)+qword(f[i]);
  if qword(now)>qword(n) then
     sum:=qword(sum)+qword(1);
  exit;
  end;
if st[dep]<>'?' then
   begin
   f[dep]:=ord(st[dep])-48;
   dfs(dep+1);
   exit;
   end;
if dep=1 then down:=1 else down:=0;
for i:=down to 9 do
    begin
    f[dep]:=i;
    dfs(dep+1);
    end;
end;
begin
assign(input,'wild.in');
reset(input);
assign(output,'wild.out');
rewrite(output);
readln(st);
readln(n);
num:=n;
while num>0 do
  begin
  inc(cnt);
  f[cnt]:=num mod 10;
  num:=num div 10;
  end;
for i:=1 to cnt div 2 do
  begin
  tmp:=f[i];
  f[i]:=f[cnt+1-i];
  f[cnt+1-i]:=tmp;
  end;
dfs(1);
writeln(sum);
close(input);
close(output);
end.