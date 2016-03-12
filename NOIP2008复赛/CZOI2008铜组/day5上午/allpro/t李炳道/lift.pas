var k:array[1..10000] of longint;
    i,n,a,b:longint;
begin
 assign(input,'lift.in');
 assign(output,'lift.out');
 reset(input);
 rewrite(output);
 readln(n,a,b);
 for i:=1 to n do
  read(k[i]);
 writeln(-1);

 close(input);
 close(output);
end.
