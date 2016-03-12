const max=100000000;
var n,i,j,k,s,t,r:longint;
    a:array[1..max] of 1..200;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  t:=1;
  r:=1;
  for i:=1 to n do
    begin
      for j:=1 to r do inc(a[j]);
      for j:=1 to t do
        if (a[j]>=3) and (a[j]<>0) then inc(r);
      t:=r;
    end;
  for i:=1 to max do
    if a[i]=0 then break;
  writeln(i-1);
  close(input);
  close(output);
end.
