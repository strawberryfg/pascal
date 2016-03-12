var time:array[1..100] of longint;
    p:array[1..100] of longint;
    f:array[0..1000] of longint;
    i,ans,t,m,j:longint;

function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;

begin
  assign(input,'medic.in');
  assign(output,'medic.out');
  reset(input);
  rewrite(output);
  readln(t,m);
  for i:=1 to m do readln(time[i],p[i]);
  for i:=0 to t do f[i]:=0;
  for i:=1 to m do
    for j:=t downto time[i] do
      f[j]:=max(f[j],f[j-time[i]]+p[i]);
  ans:=0;
  for i:=1 to t do ans:=max(ans,f[i]);
  writeln(ans);
  close(input);
  close(output);
end.
