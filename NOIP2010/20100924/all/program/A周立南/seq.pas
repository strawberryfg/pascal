var up,down,c:array [0..100005] of longint;
    i,n,minn:longint;

function min(a,b:longint):longint;
begin
  if a<b then exit(a)
         else exit(b);
end;

function max(a,b:longint):longint;
begin
  if a>b then exit(a)
         else exit(b);
end;

begin
  assign(input,'seq.in');
  assign(output,'seq.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(c[i]);
  up[1]:=c[1];
  down[1]:=2*c[1]-c[2];
  for i:=2 to n-1 do
    begin
      up[i]:=min(c[i],c[i-1]*2-down[i-1]);
      down[i]:=max(up[i-1],c[i]*2-c[i+1]);
    end;
  up[n]:=min(c[n],c[n-1]*2-down[n-1]);
  down[n]:=up[n-1];
  up[n+1]:=c[n]*2-down[n];
  down[n+1]:=c[n];
  minn:=maxlongint;
  for i:=1 to n+1 do
    begin
      if up[i]-down[i]+1<minn then minn:=up[i]-down[i]+1;
    end;
  writeln(minn);
  close(input);
  close(output);
end.
