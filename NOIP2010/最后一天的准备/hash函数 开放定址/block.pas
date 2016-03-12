var n,m,i,tot,sum,num,j,tx,ty,tz:longint;
    hash:array[1..1000000]of longint;
	lian:array[1..1000000,1..4]of longint;
procedure work(x,s,t,p:longint);
var now:longint;
begin
if hash[x]=0 then{}
	begin
	inc(tot);
	hash[x]:=tot;
	lian[tot,1]:=s; lian[tot,2]:=t; lian[tot,3]:=p;
	inc(sum);
	end
else begin{}
	now:=hash[x];
	if (lian[now,1]=s)and(lian[now,2]=t) then exit;
	while lian[now,4]<>0 do
		begin
		now:=lian[now,4];
		if (lian[now,1]=s)and(lian[now,2]=t) then exit;
		end;
	inc(tot);
	lian[now,4]:=tot;
	lian[tot,1]:=s;
	lian[tot,2]:=t;
	lian[tot,3]:=p;
	inc(sum);
	end;
end;
function calc(a,b,c:longint):longint;
var t:longint;
begin
t:=313*a+197*b+151*c;
exit(t);
end;
begin
assign(input,'block.in');
reset(input);
assign(output,'block.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin{}
	readln(tx,ty,tz);
	if tx=0 then {}
		begin
		for j:=1 to n do {}
			begin
			num:=calc(j,ty,tz);
			work(num,j,ty,tz);
			end;
		end{}
	else if ty=0 then {}
			begin
			for j:=1 to n do{}
				begin
				num:=calc(tx,j,tz);
				work(num,tx,j,tz);
				end;
			end
		else begin {}
			for j:=1 to n do
				begin
				num:=calc(tx,ty,j);
				work(num,tx,ty,j);
				end;
			end;
    end;{}
writeln(sum);
close(input);
close(output);
end.
