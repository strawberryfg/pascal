var n:longint;
    a:array[1..1000] of longint;
function prime(n:longint):boolean;
var i:longint;
begin
  prime:=true;
  for i:=2 to trunc(sqrt(n)) do
    if n mod i=0 then begin prime:=false;exit end;
end;
function pc(n:longint):boolean;
var i,s:longint;
begin
  pc:=true;
  for i:=1 to n-1 do
    begin
      s:=a[i]+a[i+1];
      if prime(s)=false then begin pc:=false;exit end;
    end;
  if prime(a[n]+a[1])=false then pc:=false;
end;
function check(dep:longint):boolean;
var i:longint;
begin
  check:=true;
  for i:=1 to dep-1 do
    if a[dep]=a[i] then begin check:=false;exit end;
end;
procedure print;
var i:longint;
begin
  for i:=1 to n-1 do
    write(a[i],' ');
  writeln(a[n]);
end;
procedure try(dep:longint);
var i:longint;
begin
  if (dep>n) and (pc(n)=true) and (a[1]=1)then print
           else for i:=1 to n do
                      begin
                        a[dep]:=i;
                        if (check(dep)=true) then try(dep+1);
                      end;
end;
begin
  assign(input,'prime.in');
  reset(input);
  assign(output,'prime.out');
  rewrite(output);
  readln(n);
  try(1);
  close(input);
  close(output);
end.
