var n,k,i:longint;
    a:array[1..10000] of integer;
procedure qsort(l,r:longint);
var i,j,m,t:longint;
begin
  i:=l;j:=r;
  m:=a[(l+r) div 2];
  repeat
    while a[i]<m do inc(i);
    while a[j]>m do dec(j);
      if i<=j then begin
                     t:=a[i];
                     a[i]:=a[j];
                     a[j]:=t;
                     inc(i);
                     dec(j);
                   end;
  until i>j;
  if l<j then qsort(l,j);
  if i<r then qsort(i,r);
end;
begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);
  read(n,k);
  for i:=1 to n do
  readln(a[i]);
  qsort(1,n);
  for i:=1 to n do
    if i=n-k+1 then begin  writeln(a[i]);   break; end;
  close(input);
  close(output);
end.

