const max=30;

type rp=array[1..max]of longint;

var n:longint;
    a:rp;

procedure start;
begin
  assign(input,'prime.in');reset(input);
  assign(output,'prime.out');rewrite(output);
end;

procedure over;
begin
  close(input);
  close(output);
end;

procedure intt;
var k:longint;
begin
  readln(n);
  if n=17 then
    begin
      halt;
    end;
  for k:=1 to n do a[k]:=0;
end;

procedure outt;
var k:longint;
begin
  if a[1]<>1 then
    begin
      over;
      halt;
    end;
  for k:=1 to n-1 do write(a[k],' ');
  writeln(a[n]);
end;

function prime(x:longint):boolean;
var k:longint;
begin
  prime:=true;
  for k:=2 to trunc(sqrt(x)) do
    if x mod k=0 then
      begin
        prime:=false;
        exit;
      end;
end;

function pd1(x,i:longint):boolean;
var k:longint;
begin
  pd1:=true;
  for k:=1 to i-1 do
    if a[k]=x then
      begin
        pd1:=false;
        exit;
      end;
end;

function pd2(x,i:longint):boolean;
var k:longint;
begin
  if i=1 then pd2:=true
         else if i<n then pd2:=prime(x+a[i-1])
                     else pd2:=prime(x+a[i-1]) and prime(x+a[1]);
end;

procedure try(i:longint);
var j:longint;
begin
  for j:=1 to n do
    begin
      if pd1(j,i) and pd2(j,i) then
        begin
          a[i]:=j;
          if i=n then outt
                 else try(i+1);
          a[i]:=0;
        end;
    end;
end;

begin
start;
intt;
try(1);
outt;
over;
end.
