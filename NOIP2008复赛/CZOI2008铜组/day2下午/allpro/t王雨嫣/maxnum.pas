var n,i,j,sum:longint;
    a:array[1..1000]of longint;
function pan(m:longint):boolean;
var j:longint;
begin
pan:=true;
for j:=1 to n do
    if a[j] mod m<>0 then begin pan:=false;exit;end;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
n:=0;
i:=10000;
while not eof do
      begin
      inc(n);
      readln(a[n]);
      if a[n]<i then i:=a[n];
      end;
sum:=1;
for j:=2 to i do
    if pan(j) then sum:=j;
writeln(sum);
close(input);
close(output);
end.
