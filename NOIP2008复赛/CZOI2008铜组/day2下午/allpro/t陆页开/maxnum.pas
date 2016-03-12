var a,b:array[1..1000] of longint;
    i,j,t:longint;
function gys(m,n:longint):longint;
  var r:longint;
  begin
  repeat
  gys:=0;
  r:=m mod n;
  m:=n;
  n:=r;
  until r=0;
  gys:=m;
  end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
while not eof do
      begin
      inc(i);
      readln(a[i]);
      end;
for j:=1 to i do
    begin
    if j=i then begin b[j]:=gys(a[i],a[1]);break;end;
    b[j]:=gys(a[j],a[j+1]);
    end;
for j:=1 to i do
    if b[j]<b[j+1] then begin t:=b[j];b[j]:=b[j+1];b[j+1]:=t;end;
writeln(b[i]);
close(input);
close(output);
end.
