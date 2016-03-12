var a,b,c,d,i,j,m,n,max:longint;
l,r,t:array[0..1001] of longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n do
read(t[i]);
readln;
fillchar(l,sizeof(l),0);
fillchar(r,sizeof(r),0);
l[1]:=1;
if t[2]>t[1] then l[2]:=2 else l[2]:=1;
for i:=3 to n do
 for j:=1 to i-1 do
	if (l[j]>=l[i]) and (t[j]<t[i]) then l[i]:=l[j]+1;
r[n]:=1;
if t[n-1]>t[n] then r[n-1]:=2 else r[n-1]:=1;
for i:=n-2 downto 1 do
 for j:=i+1 to n do
	if (r[j]>=r[i]) and (t[j]<t[i]) then r[i]:=r[j]+1;
max:=0;
for i:=1 to n do
if (l[i]+r[i])>max then max:=l[i]+r[i];
if n-max>=0 then writeln(n-max) else writeln(0);
close(input);
close(output);
end.
