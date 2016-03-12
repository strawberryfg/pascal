program count;
var t,n,i,x,y:longint;
    k:array[0..9]of integer;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  read(n);
  t:=0;
  for i:=0 to 9 do
    k[i]:=0;
  repeat
    inc(t);
    y:=t;
    repeat
      x:=y mod 10;
      y:=y div 10;
      for i:=0 to 9 do
        if x=i then inc(k[i]);
    until y=0;
  until t=n;
  for i:=0 to 9 do
    writeln(k[i]);
  close(input);
  close(output);
end.
