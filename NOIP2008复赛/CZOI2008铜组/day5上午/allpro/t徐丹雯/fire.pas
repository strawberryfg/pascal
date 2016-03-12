var a:array[1..1000000]of int64;
    n,c:longint;

function place(i,j:integer):boolean;
var k:integer;
begin
  place:=false;
  for k:=1 to  n do
  begin
    if a[i]=j then place:=false;
    if a[k]-k=i-j then place:=false;
    if a[k]+k=i+j then place:=false;
  end;
end;
procedure writeout;
var i:integer;
begin
  for i:=1 to n do
  write(a[i]);
  if c mod 10=0 then readln;
  writeln;
end;
procedure try(i:integer);
var j:integer;
begin
  j:=0;
for i:=1 to n do
  begin
    a[i]:=j;
    if place(i,j) then begin
                       writeout;c:=c+1;
                       end
                  else try(i+1);
  end;
end;
begin
{assign(input,'q.in');
reset(input);
assign(output,'q.out');
rewrite(output);}
readln(n);
c:=0;
try(1);
close(input);
close(output);
end.
