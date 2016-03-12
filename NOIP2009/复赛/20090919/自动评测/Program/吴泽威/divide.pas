var n,k,i,j:longint;
    a,f:array [0..10001] of int64;
    c,t:int64;

procedure sort(l,r:longint);
var i,j:longint;
    x,y:int64;
begin
i:=l; j:=r;
x:=a[random(r-l+1)+l];
repeat while a[i]<x do inc(i);
       while a[j]>x do dec(j);
       if i<=j then begin
		    y:=a[i]; a[i]:=a[j]; a[j]:=y;
                    inc(i); dec(j);
		    end;
until i>j;
if j>l then sort(l,j);
if i<r then sort(i,r);
end;

begin
assign(input,'divide.in');
assign(output,'divide.out');
reset(input);
rewrite(output);
readln(n,k,j);
c:=j;
for i:=1 to n do
  begin
  read(j);
  a[i]:=j;
  end;
sort(1,n);
for i:=k to n do
  begin
  f[i]:=sqr(a[i]-a[1])+c;
  for j:=k to i-k do
    begin
    t:=f[j]+sqr(a[i]-a[j+1])+c;
    if t<f[i] then f[i]:=t;
    end;
  end;
writeln(f[n]);
close(input);
close(output);
end.
