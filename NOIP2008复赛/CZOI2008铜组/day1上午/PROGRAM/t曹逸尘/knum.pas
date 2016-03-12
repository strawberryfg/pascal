program knum;
var i,N,K,j:integer;
    a:array[1..100] of integer;
begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);
  readln(N,K);
  for i:= 1 to n do
    readln(a[i]);
  for i:= 1 to n do
    if a[i]<a[i+1] then j:=a[i+1]; a[i]:=a[i+1]; a[i]:=j;
  for i:= 1 to n do
    if i=3 then write(a[i]);
  close(input);
  close(output);
end.