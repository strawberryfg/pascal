var a,b,c,i,tot,res:longint;
	pd:boolean;
	t:int64;
	f:array[0..3000000]of longint;
	hash:array[0..1000000]of longint;
	lian:array[1..2200000,1..3]of longint;
procedure work(now,num:longint);
var mo,p:longint;
begin
mo:=num mod 999983;
if hash[mo]=0 then{}
	begin
	inc(tot);
	hash[mo]:=tot;
	lian[tot,1]:=num div 999983;
	lian[tot,2]:=now;
	lian[tot,3]:=0;
	end
else	begin{}
		p:=hash[mo];
		if lian[p,1]=num div 999983 then
			begin
			res:=now;
			if res>2000000 then writeln(-1)
				else writeln(res);
			pd:=true;
			exit;
			end;
		while lian[p,3]<>0 do
			begin
			p:=lian[p,3];
			if (lian[p,1]=num div 999983) then
				begin
				res:=now;
				if res>2000000 then writeln(-1)
				else writeln(res);
				pd:=true;
				exit;
				end;
			end;
		inc(tot);
		lian[p,3]:=tot;
		lian[tot,1]:=num div 999983;
		lian[tot,2]:=now;
		lian[tot,3]:=0;
		end;
end;
begin
assign(input,'seq.in');
reset(input);
assign(output,'seq.out');
rewrite(output);
readln(a,b,c);
f[0]:=1;
tot:=1;
hash[1]:=1;
lian[1,1]:=0;
lian[1,2]:=0;
lian[1,3]:=0;
i:=0;
pd:=false;
while true do
	begin
	t:=int64(f[i])*int64(a) mod c;
	t:=t+(int64(f[i]) mod b)mod c;
	t:=t mod c;
	inc(i);
	f[i]:=t;
	work(i,f[i]);
	if pd then break;
	if i>2000000 then begin writeln(-1);pd:=true; break; end;
	end;
close(input);
close(output);
end.
