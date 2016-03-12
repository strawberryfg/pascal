//11:29
type arr=array[-1..1000]of longint;
var s1,s2:string;
    a,b,con,c,res:arr;
    i,n:longint;
procedure print(x:arr);
var i:longint;
begin
write(x[x[-1]]);
for i:=x[-1]-1 downto 0 do
	begin
	if x[i]>999 then write(x[i])
		else if x[i]>99 then write('0',x[i])
			else if x[i]>9 then write('00',x[i])
					else write('000',x[i]);
	end;
writeln;
end;
function mul(a,b:arr):arr;
var max,i,j,k:longint;
begin
max:=a[-1]+b[-1];
fillchar(res,sizeof(res),0);
for i:=0 to a[-1] do
	begin
	for j:=0 to b[-1] do
		begin
		res[i+j]:=res[i+j]+a[i]*b[j];
		res[i+j+1]:=res[i+j+1]+res[i+j] div 10000;
		res[i+j]:=res[i+j] mod 10000;
		k:=i+j+1;
		while res[k]>10000 do
			begin
			if k>max then max:=k;
			res[k+1]:=res[k+1]+res[k] div 10000;
			res[k]:=res[k] mod 10000;
			inc(k);
			end;
		end;
	end;
k:=max+1;
while res[k]>10000 do
	begin
	if k>max then max:=k;
	res[k+1]:=res[k+1]+res[k] div 10000;
	res[k]:=res[k] mod 10000;
	inc(k);
	end;
if res[k]<>0 then if k>max then max:=k;
res[-1]:=max;
exit(res);
end;
procedure handle(strr:string;cho:longint);
var tmp,ts:string;
	code:integer;
	tot:longint;
begin
fillchar(con,sizeof(con),0);
tot:=-1;
ts:=strr;
while length(ts)>4 do
	begin
	tmp:=copy(ts,length(ts)+1-4,4);
	inc(tot);
	val(tmp,con[tot],code);
	delete(ts,length(ts)+1-4,4);
	end;
inc(tot);
val(ts,con[tot],code);
con[-1]:=tot;
if cho=1 then a:=con else b:=con;
end;
begin
assign(input,'mul.in');
reset(input);
readln(s1);
readln(s2);
readln(n);
for i:=1 to n do
    begin
    handle(s1,1);
    handle(s2,2);
    c:=mul(a,b);
    end;
print(c);
close(input);
end.
