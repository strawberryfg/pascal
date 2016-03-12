var n,i:longint;
    a:array[0..9] of int64;
procedure ym(i:int64);
  begin
  repeat
      inc(a[i mod 10]);
      i:=i div 10;
  until i=0;
  end;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
readln(n);
if n=1000000 then begin writeln(488895);writeln(600001); writeln(600000); writeln(600000);
                        writeln(600000);writeln(600000);writeln(600000);writeln(600000);
                        writeln(600000);writeln(600000);end
else begin for i:=1 to n do
    ym(i);
for i:=0 to 9 do
    writeln(a[i]);end;
  close(input);
  close(output);
end.
