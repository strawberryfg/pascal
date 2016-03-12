const max=1000;
var a:array[1..max]of longint;
    i,n,s:longint;
function front(n:longint):longint;
	var i,s:longint;
	begin
	s:=0;
	for i:=1 to n do
		if a[i]>a[n] then inc(s);
	front:=s;
	end;
function back(m:longint):longint;
        var i,s:longint;
        begin
        s:=0;
        for i:=m to n do
                if a[i]>a[m] then inc(s);
        back:=s;
        end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
	readln(a[i]);
s:=0;
for i:=1 to n do
	if front(i)=back(i) then inc(s);
writeln(s);
close(input);
close(output);
end.
