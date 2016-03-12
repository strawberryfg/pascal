var i,j,n,final,num,spe:longint;
    g:array[0..20,0..20]of longint;
    f:array[1..140000,0..20]of longint;	two:array[0..22]of longint;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
function fun(nowstate,knum:longint):longint;
var i,fmin:longint;
begin
if nowstate=0 then exit(0);
if f[nowstate,knum]<>0 then exit(f[nowstate,knum]);
fmin:=maxlongint;
for i:=1 to n do
    begin
	if nowstate and two[i]>0 then
	   begin
	   fmin:=min(fmin,fun(nowstate-two[i],i)+g[knum,i]);
	   end;
	end;f[nowstate,knum]:=fmin;
exit(f[nowstate,knum]);
end;
begin
assign(input,'minsum.in');
reset(input);
assign(output,'minsum.out');
rewrite(output);
readln(n);
for i:=1 to n do
	begin
	for j:=1 to n do
		begin
		read(g[i,j]);
		end;
	readln;
	end;two[0]:=1; two[1]:=1;
for i:=2 to n+1 do two[i]:=two[i-1]*2;
spe:=two[n+1]-1;
final:=maxlongint;
for i:=1 to n do
    begin
	num:=spe-two[i];
	f[num,i]:=fun(num,i);
	if f[num,i]<final then final:=f[num,i];	end;	writeln(final);
close(input);
close(output);
end.
