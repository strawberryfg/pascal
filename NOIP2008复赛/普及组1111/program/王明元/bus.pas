var n,d,i,s:longint;
a:array[1..2]of longint;
str:string;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
s:=0;
readln(n,d);
readln(str);
for i:=s to n do
	if str[i]='H' then inc(a[1])
			else inc(a[2]);
	if (a[1]=0)or(a[2]=0) then begin end
				else if (a[1]-a[2]>d)or(a[2]-a[1]>d) then inc(s);
writeln(s+1);
close(input);
close(output);
end.