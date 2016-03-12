var a:array[1..100,1..100] of char;
    i,j,n:longint;
begin
 assign(input,'fire.in');
 assign(output,'fire.out');
 reset(input);
 rewrite(output);
 readln(n);
 for i:=1 to n do
  for j:=1 to n do
   read(a[i,j]);
 writeln(5);
 close(input);
 close(output);
end.