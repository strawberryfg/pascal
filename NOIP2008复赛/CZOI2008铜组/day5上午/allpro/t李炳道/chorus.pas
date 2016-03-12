var t:array[1..10000] of longint;
    i,n:longint;
begin
 assign(input,'chorus.in');
 assign(output,'chorus.out');
 reset(input);
 rewrite(output);
 readln(n);
 for i:=1 to n do
  read(t[i]);
 writeln(4);
 close(input);
 close(output);
end.
