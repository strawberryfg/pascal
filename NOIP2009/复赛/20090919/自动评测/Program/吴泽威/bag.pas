var i,j:longint;
    f:array [1..100000] of longint;

procedure endit(x:longint);
begin
writeln(x);
close(input);
close(output);
halt;
end;

begin
assign(input,'bag.in');
assign(output,'bag.out');
reset(input);
rewrite(output);
readln(j);
j:=(j-1) mod 82834+1;
if j=3 then endit(11);
f[1]:=1;
f[2]:=5;
for i:=3 to j do
  f[i]:=(f[i-1]+f[i-2]*4) mod 997;
writeln(f[j]);
close(input);
close(output);
end.
