program num(input,output);
var a:array[1..1000] of integer;
    n,i,front,behind,total,j:integer;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  total:=0;
  for i:=1 to n do
  begin
    front:=0;
    behind:=0;
    for j:=1 to i-1 do
      if a[j]>a[i] then front:=front+1;
    for j:=i+1 to n do
      if a[j]>a[i] then behind:=behind+1;
    if front=behind then total:=total+1;
  end;
  writeln(total);
  close(input);
  close(output);
end.