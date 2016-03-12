var n,m,i,a,b:longint;
    p,count:array[1..1000]of boolean;
    f:array[1..1000]of integer;
    ha:array[1..1000,1..1000]of integer;
procedure go(now:longint);
var i:longint;
begin
  p[now]:=true;
  for i:=1 to f[now] do
    if not p[ha[now,i]] then go(ha[now,i])
                        else count[ha[now,i]]:=true;
end;
begin
  assign(input,'message.in'); reset(input);
  assign(output,'message.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do begin readln(a,b); inc(f[a]); ha[a,f[a]]:=b; end;
  for i:=1 to n do
  begin
    fillchar(p,sizeof(p),false);
    if count[i] then writeln('T') else
    begin go(i); if count[i] then writeln('T') else writeln('F'); end;
  end;
  close(input); close(output);
end.