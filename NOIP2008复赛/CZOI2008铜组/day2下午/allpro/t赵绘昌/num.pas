var a:array[1..1000] of longint;
    i,j,k,n,l,t,kk:longint;
function pan(x:longint):boolean;
  var i,j,i1,j1:longint;
  begin
  pan:=true;
  i1:=0;
  j1:=0;
  for i:=1 to x-1 do
      if a[i]>a[x] then inc(i1);
  for j:=1000 downto x+1 do
      if a[j]>a[x] then inc(j1);
  if i1<>j1 then pan:=false;
  end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
    read(a[i]);
kk:=0;
for i:=1 to n do
    begin
    if pan(i) then inc(kk);
    end;
writeln(kk);
close(input);
close(output);
end.