program cow(input,output);
var t:array[1..200] of int64;
    i,n,j:integer;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  if n<4 then begin
                writeln('1');
                close(input);
                close(output);
                exit;
              end;
  for i:=1 to n do
    t[i]:=0;
  t[1]:=1;
  t[2]:=1;
  t[3]:=1;
  for i:=4 to n do
    t[i]:=t[i-1]+t[i-3];
  writeln(t[n]);
  close(input);
  close(output);
end.
