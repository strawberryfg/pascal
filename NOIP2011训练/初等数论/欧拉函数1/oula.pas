const max=1000000;
var n,tn,i,cnt,sum,s:longint;
    res:extended;
    prime:array[1..max]of longint;
    a:array[1..max]of boolean;
    flag:boolean;
procedure eratos;

    var
       i,j : longint;

    begin
       a[1]:=false;
       for i:=2 to max do
         a[i]:=true;
       for i:=2 to max div 2 do
         if a[i] then
           for j:=2 to max div i do
             a[i*j]:=false;
       sum:=0;
       for i:=1 to max do
        begin
          if a[i] then
           begin

             inc(sum);
             prime[sum]:=i;
           end;
        end;
    end;
function calc(x:longint):extended;
begin
exit(1-1/x);
end;
begin
readln(n);
 eratos;
while n<>0 do
  begin
  tn:=n;
  res:=n;
  s:=0;
  for i:=2 to trunc(sqrt(tn)) do
      begin
      cnt:=0;
      while n mod i=0 do
        begin
        n:=n div i;
        inc(cnt);
        end;
      if cnt<>0 then res:=res*calc(i);
      if n=1 then break;
      end;
  if n<>1 then res:=res*calc(n);
  writeln(res:0:0);
  readln(n);
  end;
end.
