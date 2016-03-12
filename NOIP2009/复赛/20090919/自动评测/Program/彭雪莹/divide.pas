var f:array[0..10005] of int64;
    a:array[0..10005] of longint;
    i,j,k,n,c:longint;
function min(a,b:longint):longint;
begin
  if a<b then exit(a) else exit(b);
end;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

begin
  assign(input,'divide.in');
  assign(output,'divide.out');
  reset(input);
  rewrite(output);
  readln(n,k,c);
  for i:=1 to n do read(a[i]);
  sort(1,n);
  f[0]:=0;
  for i:=k to n do f[i]:=c+int64(a[i]-a[1])*(a[i]-a[1]);
  for i:=k+1 to n do
    for j:=i-k downto k do
    if f[j]<>0 then
      f[i]:=min(f[i],f[j]+c+int64(a[i]-a[j+1])*(a[i]-a[j+1]));
  writeln(f[n]);
  close(input);
  close(output);
end.
