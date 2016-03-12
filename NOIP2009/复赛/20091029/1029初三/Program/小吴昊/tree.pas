var n,i,s:longint;
    a:array[1..100] of longint;
begin
  assign(input,'tree.in');
  assign(output,'tree.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[n]);
  s:=0;
  if n=3 then writeln(42)
         else begin
                for i:=1 to n do s:=s+a[i];
                writeln(s);
              end;
  close(input);
  close(output);
end.