var f,n:int64;

function fib(n:integer):longint;
begin
  if (n=1)or(n=2)or(n=3) then fib:=1
                         else fib:=fib(n-3)+fib(n-1);
end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
  readln(n);
  f:=fib(n);
  writeln(f);
  readln;
close(input);
close(output);
end.
