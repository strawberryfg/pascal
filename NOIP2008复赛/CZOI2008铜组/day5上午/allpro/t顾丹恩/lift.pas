var a,b,c,d,i,j,m,n,l,r,o:longint;
v,s,z:array[0..2001] of longint;

procedure find(m,o:longint);
begin
if (m+v[m]<=n) and (z[m+v[m]]=0) then
	begin
	s[m+v[m]]:=o;z[m+v[m]]:=1;find(m+v[m],o+1);
	end;
if (m-v[m]>=1) and (z[m-v[m]]=0) then
	begin
	s[m-v[m]]:=o;z[m-v[m]]:=1;find(m-v[m],o+1);
	end;
end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n do
read(v[i]);
readln;
fillchar(z,sizeof(z),0);
s[a]:=0;
z[a]:=1;
find(a,1);
if (s[b]>0) then writeln(s[b]) else
if a=b then writeln(0) else writeln(-1);
close(input);
close(output);
end.
