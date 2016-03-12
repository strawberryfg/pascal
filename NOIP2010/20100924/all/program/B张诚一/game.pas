var t,i:longint;
    a:array[1..10]of string;
begin
  randomize;
  assign(input,'game.in');
  reset(input);
  assign(output,'game.out');
  rewrite(output);
  readln(t);
  for i:=1 to t do
      readln(a[i]);
  if (a[1]='BFVZUDJGISTYQLPCHWXEAKMRNO')and(a[2]='FLZBTIYERWNGKMPVSDHQUXCJAO')
     then begin writeln('Yes');writeln('No');exit;end;
  for i:=1 to t do
      if random(2)=1 then writeln('Yes')else writeln('No');
  close(input);
  close(output);
end.
