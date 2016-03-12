var  i,n,total:longint;
        a:array[1..1000] of longint;

function try(m:longint):boolean;
  var i,j,sum1,sum2:longint;
  begin
  sum1:=0;
  for i:=1 to m-1 do
        if a[i]>a[m] then inc(sum1);
  sum2:=0;
  for j:=m+1 to n do
        if a[j]>a[m] then inc(sum2);
  if sum1=sum2 then try:=true
                else try:=false;
  end;

begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
total:=0;
for i:=1 to n do
        readln(a[i]);
for i:=1 to n do
        if try(i) then inc(total);
writeln(total);
close(input);
close(output);
end.
