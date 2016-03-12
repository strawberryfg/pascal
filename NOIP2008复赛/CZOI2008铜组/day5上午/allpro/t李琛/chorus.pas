const max=1000;
type tlist=array[1..max] of integer;
var data:tlist;
    sum,i,maxn:integer;
procedure qsort(var a : tlist);
  procedure sort(l,r: longint);
    var i,j,x,y: longint;
    begin
      i:=l;
      j:=r;
      x:=a[(l+r) div 2];
      repeat
        while a[i]<x do
          inc(i);
        while x<a[j] do
          dec(j);
        if not(i>j) then begin
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
procedure check(a:tlist);
var i,j:integer;
begin
  i:=1;
  while i<=max do
    begin
      if a[i]=a[i+1] then sum:=sum+1;
      i:=i+1;
    end;
end;
begin
 { assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);  }
  readln(maxn);
  for i:=1 to maxn do
    readln(data[i]);
  sum:=0;
  qsort(data);
  check(data);
  writeln(sum);
  close(input);
  close(output)
end.





























































































































