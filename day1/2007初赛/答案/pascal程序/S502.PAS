program S502;
const NN=20;
      maxint=30000;
      maxl=500;
var bestx,x:array [0..NN] of integer;
    y:array [0..maxl] of integer;
    j,n,m,maxvalue:integer;
procedure result;
var j:integer;
begin
 writeln('max=',maxvalue);
 for j:=1 to n do  write(bestx[j]:4);
 writeln;
end;
procedure backtrace(i,r:integer);
var j,k:integer;
    z: array[0..maxl] of integer;
begin
 for j:=0 to x[i-2]*(m-1) do
   if (y[j]<m) then
      for k:=1 to m-y[j] do
       if (y[j]+k<=y[j+x[i-1]*k]) then
         y[j+x[i-1]*k]:=y[j]+k;
  while (y[r]<maxint) do inc(r);
  if (i>n) then
   begin
    if (r-1>maxvalue) then
     begin
       maxvalue:=r-1 ;
       for j:=1 to n do bestx[j]:=x[j];
     end;
    exit;
   end;
 for k:=0 to maxl do z[k]:=y[k];
 for j:=x[i-1]+1 to r do
  begin
   x[i]:=j;
   backtrace(i+1,r);
   for k:=0 to maxl do  y[k]:=z[k];
  end;
end;
begin
 maxvalue:=0;
 writeln('input n,m:');
 readln(n,m);
 for j:=1 to maxl do y[j]:=maxint;
 y[0]:=0;  x[0]:=0; x[1]:=1;
 backtrace(2,1);
 result;
end.


