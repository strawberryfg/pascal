program ex;
var a:array[1..10000] of longint;
      i,j,t,n,k:integer;
begin
 assign(input,'knum.in');
 reset(input);
 assign(output,'knum.out');
 rewrite(output);
 readln(n,k);
 for i:=1 to n do
  readln(a[i]);
 for j := 1 to n do
  for i:=1 to n do
   if a[i]<a[i+1] then begin t:=a[i];a[i]:=a[i+1];a[i+1]:=t;end;
  writeln(a[k]);
  close(input);
  close(output);
end.
