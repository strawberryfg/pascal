var a,b:array[1..10] of int64;
    i,x:integer;
    t,n:int64;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  a[1]:=10;b[1]:=9;
  for i:=2 to 10 do
    begin
      a[i]:=a[i-1]*10;
      b[i]:=b[i-1]*10;
    end;
  readln(n);
  for i:=10 downto 1 do
    if n>a[i] then begin
                     x:=i;
                     break;
                   end;
  for i:=1 to x do
    t:=t+b[i];
  t:=t+(n-a[x]+1)*(x+1);
  writeln(t);
  close(input);
  close(output);
end.