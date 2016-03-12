var i,n,k,s:longint;
a:array[1..30]of longint;
function pd(n:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to k do
	if n=a[i] then begin pd:=false;exit;end;
end;
procedure try(dep:longint);
var i:longint;
begin
if (pd(dep))and(dep<>n) then for i:=1 to 3 do
			begin
                        if (dep+i)>n then exit;
			try(dep+i);
			end
		else if dep=n then inc(s)
				else exit;
end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
s:=0;
readln(n);
readln(k);
for i:=1 to k do
	readln(a[i]);
try(0);
writeln(s);
close(input);
close(output);
end.