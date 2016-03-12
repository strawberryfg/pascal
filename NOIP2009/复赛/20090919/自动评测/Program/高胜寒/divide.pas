type tlist=array[1..10000]of longint;
var a:tlist;
    n,k,c,i:longint;
    r:array[1..10001]of int64;
procedure divide(f:longint;m:int64);
var s:int64;
    i:longint;
begin
  if (m<r[f])or(r[f]=0) then r[f]:=m else exit;
  s:=m+c+sqr(a[n]-a[f]);
  if (s<r[n+1])or(r[n+1]=0) then r[n+1]:=s;
  for i:=f+k to n-k+1 do
    divide(i,m+c+sqr(a[i-1]-a[f]));
end;
procedure qsort(var a : tlist);
    procedure sort(l,r: longint);
      var i,j,x,y: longint;
      begin
         i:=l; j:=r; x:=a[(l+r) div 2];
         repeat
           while a[i]<x do inc(i);
           while x<a[j] do dec(j);
           if not(i>j) then
           begin
             y:=a[i]; a[i]:=a[j]; a[j]:=y;
             inc(i); j:=j-1;
           end;
         until i>j;
         if l<j then sort(l,j);
         if i<r then sort(i,r);
      end;
    begin
       sort(1,n);
    end;
begin
  assign(input,'divide.in'); reset(input);
  assign(output,'divide.out'); rewrite(output);
  readln(n,k,c);
  for i:=1 to n do read(a[i]);
  qsort(a);
  divide(1,0);
  writeln(r[n+1]);
  close(input); close(output);
end.
