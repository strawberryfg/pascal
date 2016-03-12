var n,k:int64;
    i:longint;
function ws(n:int64):integer;
var k:integer;
begin
  k:=0;
    if (n div 10)<>0 then while n<>0 do
                           begin
                             k:=k+1;
                             n:=n div 10;
                           end
                     else k:=1;
  ws:=k;
end;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  k:=0;
  readln(n);
  for i:=1 to n do
    k:=k+ws(i);
  writeln(k);
  close(input);
  close(output);
end.
