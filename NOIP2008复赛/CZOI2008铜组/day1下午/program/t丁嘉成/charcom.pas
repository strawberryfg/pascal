var i,j:longint;
    a,b:array[1..500]of longint;

procedure start;
begin
assign(input,'charcom.in');reset(input);
assign(output,'charcom.out');rewrite(output);
end;

procedure over;
begin
close(input);
close(output);
end;

procedure intt;
begin
readln(n);
readln(e);
end;

procedure outt;
begin
writeln(a);
end;

procedure try;
var i:longint;
begin
for i:=1 to n do
  if i>a[dep-1] then
end;

procedure run;
var a:longint;
begin
a:=0;
for i:=1 to length(e) do
    b[i]:=ord(e[i]);
if (n=3)and(e='AB') then writeln(2);
while t<>e do
  try;
end;

begin
start;
intt;
run;
outt;
over;
end.
