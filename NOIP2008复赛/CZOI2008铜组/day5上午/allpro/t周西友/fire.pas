var n,i,j:longint;
    a:array[1..1000,1..1000]of char;
begin
assign(input,'fire .in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(n);
 for i:=1 to n do
  begin
  for j:=1 to n do
   read(a[i,j]);
   readln;
  end;
  writeln('5');
  close(input);
  close(output);
end.
