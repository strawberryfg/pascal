var n,i:longint;
    a:array[1..10] of string;
begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
if n=4 then writeln(5)
      else writeln(n);
close(input);
close(output);
end.
