var a,b,c,d,m,n,i,j,min,maxnum:longint;
v:array[1..1000] of longint;
s:string;
function find(m,n:longint):longint;
var min,i,j:longint;
begin
  if a>b then min:=b else min:=a;
  for i:=min downto 1 do
  if (a mod min=0) and (b mod min=0) then
                                        begin
                                        find:=i;
                                        v[n]:=i;
                                        exit;
                                        end;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
while not eof do begin
inc(i);
readln(v[i]);end;
a:=i;
i:=1;j:=2;
while j<a do
begin
find(v[i],v[j]);
inc(i);inc(j);
end;
writeln(i-1);
close(input);
close(output);
end.
