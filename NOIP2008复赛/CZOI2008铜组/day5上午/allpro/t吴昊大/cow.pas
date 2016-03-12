var i,n:longint;
    a:array[1..2,1..200] of int64;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
read(n);
a[1,1]:=0;
a[2,1]:=1;
a[1,2]:=0;
a[2,2]:=1;
a[1,3]:=0;
a[2,3]:=1;
for i:=4 to n do
    begin
    a[1,i]:=a[1,i-3]+a[2,i-3];
    a[2,i]:=a[2,i-1]+a[1,i-1];
    end;
writeln(a[1,n]+a[2,n]);
close(input);
close(output);
end.
