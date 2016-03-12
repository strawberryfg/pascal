var n,k,tn,total,j,i,t:longint;
    a:array[0..100]of longint;
    s:array[1..100]of longint;

procedure sum(n,kx:longint);
var k,m,l,i:longint;
    pd:boolean;
begin
  pd:=true;
  for i:=1 to 100 do
    if a[i]>3 then begin pd:=false; break; end;
  if pd then inc(total);
  j:=j+1;
  k:=kx;
  l:=a[k];
  for m:=a[k-1] to l div 2 do
    begin
      a[k]:=m;
      a[k+1]:=l-m;
      sum(a[k+1],k+1);
    end;
end;

begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
tn:=n;
readln(k);
tn:=n-k;
for i:=1 to k do
  begin
    readln(t);
    s[t]:=1;
  end;
a[0]:=tn;
for i:=1 to a[0] div 2 do
  begin
    a[1]:=i;
    a[2]:=a[0]-a[1];
    sum(a[0],2);
  end;
writeln(total);
close(input);
close(output);
end.