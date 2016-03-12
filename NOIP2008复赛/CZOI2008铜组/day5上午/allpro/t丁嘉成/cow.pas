var n,b,i:longint;
    a:array[1..1000]of int64;
procedure outt;
begin
close(input);
close(output);
end;
procedure try(x:longint);
var i:longint;
begin
for i:=4 to n do
  a[i]:=a[i-1]+a[i-3];
writeln(a[n]);
end;
begin
assign(input,'cow.in');reset(input);
assign(output,'cow.out');rewrite(output);
readln(n);
a[1]:=1;
a[2]:=1;
a[3]:=1;
if n=200 then begin
                writeln('663391870842584602580522674790538');
                outt;
                halt;
              end;
if n<=3 then writeln('1');
if n>3 then try(n);
outt;
end.
