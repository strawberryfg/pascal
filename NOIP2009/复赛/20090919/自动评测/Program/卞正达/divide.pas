var a:array[1..10000] of longint;
    f:array[0..1,1..10000] of int64;
    c,i,j,k,l,n:longint;
    ans:int64;

procedure sort(l,r:longint);
var
  i,j:longint;
  x,y:longint;
begin
  i:=l;j:=r;x:=a[(l+r) div 2];
  repeat
    while a[i]<x do
      inc(i);
    while x<a[j] do
      dec(j);
    if i<=j
      then
        begin
          y:=a[i];a[i]:=a[j];a[j]:=y;
          inc(i);dec(j);
        end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
  assign(input,'divide.in');reset(input);
  assign(output,'divide.out');rewrite(output);
  fillchar(a,sizeof(a),0);
  fillchar(f,sizeof(f),0);
  readln(n,k,c);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  for i:=1 to n do
    f[1,i]:=c+sqr(a[i]-a[1]);
  ans:=f[1,n];
  for i:=2 to n do
    for j:=i*k to n do
      begin
        f[i mod 2,j]:=maxlongint;
        for l:=k to j-k do
          if f[(i-1) mod 2,l]+c+sqr(a[j]-a[l+1])<f[i mod 2,j]
            then f[i mod 2,j]:=f[(i-1) mod 2,l]+c+sqr(a[j]-a[l+1]);
        if f[i mod 2,n]<ans then ans:=f[i mod 2,n];
      end;
  writeln(ans);
  close(input);close(output);
end.
