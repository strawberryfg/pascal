//14:05 14:15
type arr=array[-1..100]of longint;
var s1,s2:string;
    a,b,c,res,h:arr;
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
end;
function minus(a,b:arr):arr;
var i,t,max:longint;
begin
max:=a[-1]; if b[-1]>max then max:=b[-1];
fillchar(res,sizeof(res),0);
for i:=0 to max do
	begin
	t:=a[i]-b[i];
	if t<0 then
		begin
		res[i+1]:=res[i+1]-1;
		t:=10000+t;
		end;
	res[i]:=res[i]+t;
	end;
if res[max+1]<>0 then inc(max);
res[-1]:=max;
exit(res);
end;
procedure handle(strr:string;cho:longint);
var ts:string;
    code:integer;
    tot:longint;
begin
fillchar(h,sizeof(h),0);
tot:=-1;
while length(strr)>4 do
	begin
	ts:=copy(strr,length(strr)+1-4,4);
	inc(tot);
	val(ts,h[tot],code);
	delete(strr,length(strr)+1-4,4);
	end;
if strr<>'' then
	begin
	inc(tot);
        val(strr,h[tot]);
	end;
h[-1]:=tot;
if cho=1 then a:=h else b:=h;
end;
begin
readln(s1);
readln(s2);
handle(s1,1);
handle(s2,2);
c:=minus(a,b);
print(c);
end.
