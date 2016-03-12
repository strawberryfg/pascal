var n,i:longint;
    a:array[1..1000] of int64;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);

  a[1]:=1;
  a[2]:=1;
  a[3]:=1;
  readln(n);
  for i:=4 to n do a[i]:=a[i-1]+a[i-3];
  writeln(a[n]);

  close(input);
  close(output);
end.
