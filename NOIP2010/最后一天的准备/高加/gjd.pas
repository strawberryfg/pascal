//11:29
type arr=array[-1..100]of longint;
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
function gjd(a,b:arr):arr;
var i,max:longint;
begin
if a[-1]>b[-1] then max:=a[-1] else max:=b[-1];
fillchar(res,sizeof(res),0);
for i:=0 to max do
	begin
	res[i]:=res[i]+a[i]+b[i];
	res[i+1]:=res[i+1]+res[i] div 10000;
	res[i]:=res[i] mod 10000;
	end;
if res[max+1]<>0 then inc(max);
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
if ts<>'' then
   begin
   inc(tot);
   val(ts,con[tot],code);
   end;
con[-1]:=tot;
if cho=1 then a:=con else b:=con;
end;
begin
assign(input,'gjd.in');
reset(input);
readln(s1);
readln(s2);
readln(n);
for i:=1 to n do
    begin
    handle(s1,1);
    handle(s2,2);
    c:=gjd(a,b);
    end;
print(c);
close(input);
end.
