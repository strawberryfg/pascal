var n,max,i,j,k,i2,t,x:longint;
type arr=array[1..1000] of longint;
var a:arr;
function pd(a:arr):boolean;
var i:longint;
begin
  pd:=true;
  for i:=1 to n do
    if a[i]<>1 then begin pd:=false;exit end;
end;
begin
  assign(input,'best.in');
  assign(output,'best.out');
  reset(input);
  rewrite(output);
  readln(n);
  a[1]:=(n+1) div 2;
  a[2]:=n-a[1];
  max:=a[1]*a[2];
  i:=1;
  j:=2;
  while (pd(a)=false) and (i<=j) do
    begin
      for k:=i to j do
        begin
          if a[k]>1 then
            begin
             t:=a[k];
             a[k]:=(a[k]+1) div 2;
             a[j+1]:=t-a[k];
             inc(j);
            end;
          x:=1;
          for i2:=i to j do x:=x*a[i2];
          if x>max then max:=x;
        end;
    end;
  writeln(max);
  close(input);
  close(output);
end.
