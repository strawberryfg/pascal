var n:longint;
    a:array[1..20]of longint;
procedure print;
  var i:longint;
  begin
  for i:=1 to n-1 do
      write(a[i],' ') ;
  writeln(a[n]);
  end;
function prime1(s:longint):boolean;
  var i:longint;
  begin
  for i:=2 to trunc(sqrt(s))do
      if s mod i =0 then begin prime1:=false;exit;end;
  prime1:=true;
  end;
function check(m,i:longint):boolean;
  var j:longint;
  begin
  a[m+1]:=i;
  for j:=1 to m do
      if a[j]=a[m+1] then begin check:=false;exit end;
  if prime1(a[m+1]+a[m]) then check:=true
                    else check:=false;
  end;
procedure prime(m:longint);
  var i:longint;
  begin
  if (m=n) and prime1(a[1]+a[n])then print
                                else for i:=1 to n do
                                        if check(m,i) then prime(m+1);
  end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
read(n);
a[1]:=1;
if n mod 2=0 then prime(1);
close(input);
close(output);
end.
