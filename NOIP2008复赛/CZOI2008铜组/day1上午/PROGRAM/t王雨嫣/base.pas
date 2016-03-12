var i,j,n1,n2,m1,m2,s,number,sum:longint;
    a:array[1..100]of longint;
function bian(m,n:longint):boolean;
var i,j:longint;
begin
bian:=true;
for i:=1 to 100 do a[i]:=0;
i:=0;
while m<>0 do
      begin
      inc(i);
      a[i]:=m mod n;
      m:=m div n;
      end;
for j:=1 to (i+1)div 2 do
    if a[j]<>a[i+1-j]then begin bian:=false;exit;end;
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(n1,n2,m1,m2);
for i:=trunc(sqrt(n1)) to trunc(sqrt(n2)) do
    begin
    s:=i*i;
    if s<n1 then continue;
    number:=0;
    for j:=m1 to m2 do
        if bian(s,j) then inc(number);
    if number=1 then inc(sum);
    end;
writeln(sum);
close(input);
close(output);
end.