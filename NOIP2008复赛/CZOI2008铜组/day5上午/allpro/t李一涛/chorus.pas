var a,b:array[1..1000]of longint;
    i,j,n,s:longint;
procedure sort(l,r:longint);
var i,j,x,y:longint;
begin
  i:=l; j:=r;
  x:=a[(l+r) div 2];
  repeat
    while a[i]<x do inc(i);
    while x<a[j] do dec(j);
    if not(i>j) then
      begin
        y:=a[i];
        a[i]:=a[j];
        a[j]:=y;
        inc(i);
        j:=j-1;
      end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;
begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do read(b[i]);
  a:=b; i:=1;
  sort(i,n div 2); sort(n div 2+i,n);
  for i:=1 to n do if a[i]=b[i] then inc(s);
  writeln(s);
  close(input); close(output);
end.