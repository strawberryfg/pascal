var num1,num2,gcd:longint;
function max(a,b:longint):longint;
var c:longint;
begin
  c:=a mod b;
  while c<>0 do begin a:=b;b:=c;c:=a mod b end;
  max:=b;
end;
begin
  assign(input,'maxnum.in');reset(input);
  assign(output,'maxnum.out');rewrite(output);
  readln(num1);readln(num2);
  gcd:=max(num1,num2);
  while not(eof) do begin num1:=gcd;readln(num2);gcd:=max(num1,num2) end;
  writeln(gcd);close(input);close(output);
end. 