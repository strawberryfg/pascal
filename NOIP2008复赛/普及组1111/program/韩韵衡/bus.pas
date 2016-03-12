const maxn=2500;
var
	nj,nh,nd:array[0..maxn]of longint;
	ch:array[1..maxn]of char;
	n,d,i,t,last:longint;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
nh[0]:=0;
nj[0]:=0;
nd[0]:=0;
for i:=1 to n do
	begin
	read(ch[i]);
	case ch[i] of
		'J':begin
                nj[i]:=nj[i-1]+1;
                nh[i]:=nh[i-1]; end;
		'H':begin nj[i]:=nj[i-1]; nh[i]:=nh[i-1]+1; end;
		end;
	nd[i]:=abs(nj[i]-nh[i]);
	end;
t:=0;
last:=0;
while last<>n do
	begin
	t:=t+1;
	for i:=last+1 to n do
		if (nd[i]<=d)or(0=nh[i])or(0=nj[i])
			then last:=i;
	for i:=last+1 to n do
		begin
		nh[i]:=nh[i]-nh[last];
		nj[i]:=nj[i]-nj[last];
		nd[i]:=nd[i]-nd[last];
		end;
	end;
writeln(t);
close(input);
close(output);
end.
