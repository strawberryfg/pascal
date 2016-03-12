program ex3;
var
  n,x,y:integer;
  a:array[1..10,1..10,1..3] of integer;
  max:integer;

begin
  assign(input,'work3.in');
  reset(input);
  assign(output,'work3.out');
  rewrite(output);

  readln(n);
  for x:=1 to n do
  begin
    for y:=1 to x do
    begin
      read(a[x,y,1]);
      a[x,y,2]:=0;
      a[x,y,3]:=0;
    end;
    readln;
  end;

  a[1,1,2]:=a[1,1,1];
  for x:=2 to n do
  begin
    a[x,1,2]:=a[x-1,1,2]+a[x,1,1];
    for y:=2 to x-1 do
      if a[x-1,y-1,2]>a[x-1,y,2]
      then a[x,y,2]:=a[x,y,1]+a[x-1,y-1,2]
      else begin
             a[x,y,2]:=a[x,y,1]+a[x-1,y,2];
             a[x,y,3]:=1;
           end;
    a[x,x,2]:=a[x,x,1]+a[x-1,x-1,2];
  end;

  max:=a[n,1,2];
  for y:=2 to n do
    if max<a[n,y,2]
    then max:=a[n,y,2];

  writeln(max);

  close(input);
  close(output);
end.

