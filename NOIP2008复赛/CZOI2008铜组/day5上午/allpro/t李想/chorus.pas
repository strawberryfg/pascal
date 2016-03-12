var n,i:longint;
    a:array[1..100] of longint;
begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
readln(n);
for i:=1 to n do
    read(a[i]);
writeln(n div 2);
close(input);
close(output);
end.
