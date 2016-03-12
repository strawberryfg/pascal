var n,i:longint;
    cow:array[1..200]of int64;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  cow[1]:=1;
  cow[2]:=1;
  cow[3]:=1;
  for i:=4 to n do
      cow[i]:=cow[i-1]+cow[i-3];
  writeln(cow[n]);
  close(input);
  close(output);
end.