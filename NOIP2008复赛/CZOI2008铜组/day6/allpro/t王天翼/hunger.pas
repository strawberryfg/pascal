var n,i,j,k,t,p:longint;
    a:array[1..1000,1..2] of integer;
    b:array[1..10000] of integer;
procedure qsort(l,r:longint);
var  i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=b[(l+r) div 2];
         repeat
           while b[i]<x do
            inc(i);
           while x<b[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=b[i];
                b[i]:=b[j];
                b[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           qsort(l,j);
         if i<r then
           qsort(i,r);
      end;
function gs(i,j:integer):integer;
var t,k:integer;
begin
  k:=0;
  for t:=i to j do
    k:=k+1;
  gs:=k;
end;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(n);
  t:=0;
  k:=0;
  for i:=1 to n do
    for j:=1 to 2 do
      read(a[i,j]);
  for i:=1 to n do
    begin
      inc(k);
      b[k]:=b[k]+gs(a[i,1],a[i,2]);
    end;
  qsort(1,k);
  p:=b[k]+b[k-1];
  write(p);
  close(input);
  close(output);
end.