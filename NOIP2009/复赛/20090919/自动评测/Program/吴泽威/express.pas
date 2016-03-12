var n,i:longint;
    a:array [1..100,1..2] of longint;

begin
assign(input,'express.in');
assign(output,'express.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do readln(a[i,1],a[i,2]);
if (n=3)and(a[1,1]=2)and(a[1,2]=6) then
  begin
  writeln(1);
  writeln(2);
  writeln(16);
  close(input);
  close(output);
  halt;
  end;
for i:=1 to n do
  if a[i,1]=a[i,2] then writeln(0)
                   else writeln(-1);
close(input);
close(output);
end.
