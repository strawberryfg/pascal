var 
a:array[1..100] of longint;
f:array[0..1000] of longint;
i,ans,t,m,j:longint;

function max(a,b:longint):longint;
begin
  if a>b then max:=a  else max:=b;
end;

begin{main}
	readln(t,m);
	for i:=1 to m do readln(a[i]);
	for i:=0 to t do f[i]:=0;
	f[0]:=1;
  for i:=1 to m do 
    for j:=a[i] to t do
      f[j]:=f[j]+f[j-a[i]];
	writeln(f[t]);
end.

