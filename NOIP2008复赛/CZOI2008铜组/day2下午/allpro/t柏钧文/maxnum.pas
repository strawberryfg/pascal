var i,t,n:longint;
        a:array[1..1000]of longint;

function try(a,b:longint):longint;
  var  t1,t2,r:longint;
  begin
  t1:=a;
  t2:=b;
  repeat
  r:=t1 mod t2;
  t1:=t2;
  t2:=r;
  until r=0;
  try:=t1;
  end;

begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
while not eof do
        begin
        inc(i);
        readln(a[i]);
        end;
t:=1;
n:=a[t];
while t<i do
        begin
        inc(t);
        n:=try(n,a[t]);
        end;
writeln(n);
close(input);
close(output);
end.