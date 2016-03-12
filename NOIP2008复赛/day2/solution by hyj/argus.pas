var i,j,k:longint;
    n,min,long:longint;
    num:array[1..4000,1..2]of longint;
    a:array[1..1000000,1..2]of longint;
    s:string;
procedure setup;
begin
  assign(input,'argus.in');
  reset(input);
  assign(output,'argus.out');
  rewrite(output);
end;
procedure endit;
begin
  close(input);
  close(output);
end;
procedure sort(l,r:longint);
var i,j,x,xx,y:longint;
begin
  i:=l;j:=r;
  x:=a[(l+r) div 2,2];
  xx:=a[(l+r) div 2,1];
  repeat
    while (a[i,2]<x) or ((a[i,2]=x) and (a[i,1]<xx)) do inc(i);
    while (a[j,2]>x) or ((a[j,2]=x) and (a[j,1]>xx)) do dec(j);
    if not(i>j) then
    begin
      y:=a[i,1]; a[i,1]:=a[j,1]; a[j,1]:=y;
      y:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=y;
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
  setup;
  readln(s);n:=0;
  min:=maxlongint;
  while s<>'#' do
    begin
      inc(n);
      delete(s,1,9);
      k:=pos(' ',s);
      val(copy(s,1,k-1),num[n,1]);
      val(copy(s,k+1,length(s)-k),num[n,2]);
      if min>num[n,2] then min:=num[n,2];
      readln(s);
    end;
  readln(k);
  long:=0;
  min:=min*k;
  for i:=1 to n do
    for j:=1 to min div num[i,2] do
      begin
        inc(long);
        a[long,1]:=num[i,1];
        a[long,2]:=num[i,2]*j;
      end;
  sort(1,long);
  for i:=1 to k do
    writeln(a[i,1]);
  endit;
end.
