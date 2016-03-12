program primenum;

const maxn=2000;

type list=array[1..maxn]of longint;

var n,total:longint;
    a:list;

procedure start;
begin
assign(input,'primenum.in');reset(input);
assign(output,'primenum.out');rewrite(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
var i:longint;
begin
i:=0;
n:=0;
while not eof do
  begin
    inc(i);
    readln(a[i]);
    inc(n);
  end;
total:=0;
end;

procedure outt;
begin
writeln(total);
end;

procedure try(x:longint);
var i:longint;
    t:boolean;
begin
  t:=true;
  if (x=1)or(x=0) then exit;
  if x=2 then begin
                inc(total);
                exit;
              end;
  for i:=2 to trunc(sqrt(x)) do
    if x mod i=0 then t:=false;
  if t then inc(total);
end;

procedure runit;
var i:longint;
begin
for i:=1 to n do
  try(a[i]);
end;

begin
start;
intt;
runit;
outt;
endit;
end.
