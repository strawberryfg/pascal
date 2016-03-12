program maxnum;

const maxn=2000;

type list=array [1..maxn] of longint;

var total,o,temp,j:longint;
    a:list;

procedure start;
begin
assign(input,'maxnum.in');reset(input);
assign(output,'maxnum.out');rewrite(output);
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
o:=0;
while not eof do
  begin
    inc(i);
    readln(a[i]);
    inc(o);
  end;
end;

procedure outt;
begin
writeln(a[1]);
end;

procedure try(m,n:longint);
var i,r:longint;
begin
repeat
  r:=m mod n;
  m:=n;
  n:=r;
until r=0;
temp:=m;
end;

procedure runit;
begin
while o<>1 do
  begin
    for j:=1 to o-1 do
      begin
        try(a[j],a[j+1]);
        a[j]:=temp;
      end;
  end;
end;

begin
start;
intt;
runit;
outt;
endit;
end.
