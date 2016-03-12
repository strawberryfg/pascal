program num;

const maxn=2000;

type list=array [1..maxn] of longint;

var n,total:longint;
    a:list;

procedure start;
begin
assign(input,'num.in');reset(input);
assign(output,'num.out');rewrite(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
var i:longint;
begin
readln(n);
for i:=1 to n do
  readln(a[i]);
end;

procedure outt;
begin
writeln(total);
end;

procedure runit;
var i,t1,t2,j,k:longint;
begin
for i:=1 to n do
  begin
    t1:=0; t2:=0;
    for j:=1 to i do
      if a[j]>a[i] then inc(t1);
    for k:=i to n do
      if a[k]>a[i] then inc(t2);
    if t1=t2 then inc(total);
  end;
end;

begin
start;
intt;
runit;
outt;
endit;
end.
