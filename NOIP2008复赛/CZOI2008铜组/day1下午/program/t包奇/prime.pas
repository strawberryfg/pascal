program prime;
const max=20;
var a:array[0..max]of integer;
    n,m,total:longint;
function prime(x:integer):boolean;
var k:integer;
begin
  prime:=true;
  for k:=2 to trunc(sqrt(x)) do
      if x mod k=0 then begin prime:=false;exit; end;
end;
function ju(x,i:integer):boolean;
var k:integer;
begin
     ju:=true;
     for k:=1 to i-1 do
        if a[k]=x then begin ju:=false;exit;end;
end;
function k(x,i:integer):boolean;
begin
  if i=1 then k:=true
         else if i<n then k:=prime(x+a[i-1])
                     else k:=prime(x+a[i-1]) and prime(x+a[1]);
end;
procedure p;
var k:integer;
begin
  inc(total);
  for j:=1 to n do
    begin
      for k:=1 to n-1 do
          write(a[k],' ');
      write(a[n]);
      writeln;
end;
procdure t(i:integer);
var j:integer;
begin
  for j:=1 to n do
      begin
        if ju(j,i) and k(j,i) then
        begin
        a[i]:=j;if i=n then p;
                       else t(i+1);
        a[i]:=0;
        end;
      end;
end;
begin
  assign(input,'prime.in');
  reset(input);
  assign(output,'prime.out');
  rewrite(output);
  readln(n);
  for m:=1 to n do
  a[m]:=0;
  t(1);
  close(input);
  close(output);
end.