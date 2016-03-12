var n,i,x,y:longint;
    a:array[1..1000] of longint;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
while not eof do
      begin
      inc(i);
      readln(a[i]);
      end;
n:=i;
while a[2]>0 do
      begin
      x:=a[1] mod a[2];
      a[1]:=a[2];
      a[2]:=x;
      end;
x:=a[1];
for i:=3 to n do
    begin
    while x>0 do
    begin
    y:=a[i] mod x;
    a[i]:=x;
    x:=y;
    end;
    x:=a[i];
    end;
writeln(x);
close(input);
close(output);
end.