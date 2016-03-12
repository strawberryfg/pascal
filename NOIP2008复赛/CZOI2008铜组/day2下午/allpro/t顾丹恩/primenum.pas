var a,b,m,n,i,j,sum:longint;
v:array[1..1000] of integer;
function su(a:integer):boolean;
var i:longint;
begin
if (a=1)then su:=false
else for i:=2 to trunc(sqrt(a)) do
	if (a mod i=0) then
	begin
	su:=false;
	exit;
	end
        else su:=true;
end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
i:=0;
while not eof do
  begin
  inc(i);
  readln(v[i]);
  if su(v[i]) then sum:=sum+1;
  end;
writeln(sum);
close(input);
close(output);
end.
