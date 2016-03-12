var n,i,j,s,count:longint;
    a:array[0..10000]of longint;
begin
  assign(input,'bag.in'); reset(input);
  assign(output,'bag.out'); rewrite(output);
  readln(n);
  a[0]:=1; a[1]:=1; a[2]:=5; a[3]:=11;
  for i:=4 to n do
  begin
    s:=0;
    for j:=1 to i-1 do s:=(s+a[j]) mod 997;
    count:=(s+1)mod 997;
    count:=(count+3*a[i-2])mod 997;
    s:=0;
    for j:=1 to i-3 do s:=(s+a[j]) mod 997;
    count:=(count+s+1)mod 997;
    count:=(count+a[i-4])mod 997;
    a[i]:=count;
  end;
  writeln(a[n]);
  close(input); close(output);
end.