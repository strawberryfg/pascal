var n,i,j:longint;
    s:array[1..100]of longint;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  readln(n);
  if n<10 then writeln(n)
          else begin
                 for i:=1 to n do
                 s[i]:=i;
                 writeln(i);
               end;
 close(input);
 close(output);
end.
