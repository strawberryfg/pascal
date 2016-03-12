var n:longint;
    a:array[1..17]of longint;
    o:array[1..17]of boolean;
procedure print;
var i:longint;
begin
  for i:=1 to n-1 do
      write(a[i],' ');
  writeln(a[n]);
end;
function pd(l,dep:longint):boolean;
var i:longint;
var c:longint;
begin
  pd:=true;
  for i:=2 to trunc(sqrt(l)) do
      if l mod i=0 then begin pd:=false; break; end;
  if dep=n then
  begin
    c:=a[dep]+1;
    for i:=2 to trunc(sqrt(c)) do
      if c mod i=0 then begin pd:=false; break; end;
  end;
end;
procedure prime(dep:longint);
var i:longint;
begin
  if dep>n then print;
  for i:=2 to n do
  begin
    if o[i]=false then
    begin
      a[dep]:=i;
      o[i]:=true;
      if pd(a[dep]+a[dep-1],dep) then
         begin prime(dep+1); o[a[dep]]:=false; a[dep]:=0; end else
         begin a[dep]:=0; o[i]:=false; end;
    end;
  end;
end;
begin
  assign(input,'prime.in');
  reset(input);
  assign(output,'prime.out');
  rewrite(output);
  readln(n);
  a[1]:=1;
  if n mod 2=0 then prime(2);
  close(input);
  close(output);
end.
