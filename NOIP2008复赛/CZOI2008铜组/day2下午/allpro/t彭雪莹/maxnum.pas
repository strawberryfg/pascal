var total,a,b:longint;
function  gcd(a,b:longint):longint;
var r:integer;
begin
  if b=0 then gcd:=a
  else begin
         r:=a mod b;
         gcd:=gcd(b,r);
         end;
end;

begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  readln(a);
  total:=a;
  while not eof do
    begin
      readln(b);
      total:=gcd(total,b)
    end;
  writeln(total);
  close(input);
  close(output);
end.
