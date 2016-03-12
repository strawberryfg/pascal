type
 atype=array[1..1000] of integer;
var     total,n,i,j:integer;
        a:atype;
function f(var a:atype;b,c:integer):boolean;
var front,back,i,j:integer;
 begin
   front:=0;
  back:=0;
  for i:= 1 to b-1 do
   if a[i]>a[b] then front:= front+1;
  for i:= b+1 to c do
    if a[i]>a[b] then back:= back+1;
  if front=back then f:=true
                else f:=false;
  end;
begin
  assign(input,'num.in');
   reset(input);
  assign(output,'num.out');
    rewrite(output);
  readln(n);
  total:=0;
  for i:= 1 to n do
   readln(a[i]);
  for i:=1 to n do
   if f (a,i,n) then total:=total+1;
  writeln(total);
  close(input);
  close(output);
end.

