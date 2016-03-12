var a,t:array[0..1000000]of longint;
    n,i,j:longint;
begin
  assign(input,'count.in');
  assign(output,'count.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do a[i]:=i;
  for i:=0 to 9 do t[i]:=0;
  for i:=1 to n do
    for j:=0 to 9 do begin
    if a[i] mod 10=j then inc(t[j]);
    if (a[i] div 10>=1)and((a[i] div 10) mod 10=j) then inc(t[j]);
    if (a[i] div 100>=1)and((a[i] div 100) mod 10=j) then inc(t[j]);
    if (a[i] div 1000>=1)and((a[i] div 1000) mod 10=j) then inc(t[j]);
    if (a[i] div 10000>=1)and((a[i] div 10000) mod 10=j) then inc(t[j]);
    if (a[i] div 100000>=1)and((a[i] div 100000) mod 10=j)then inc(t[j]);
    if (a[i] div 1000000>=1)and((a[i] div 1000000) mod 10=j) then inc(t[j]);
  end;
  for i:=0 to 9 do writeln(t[i]);
  close(input);
  close(output);
end.
