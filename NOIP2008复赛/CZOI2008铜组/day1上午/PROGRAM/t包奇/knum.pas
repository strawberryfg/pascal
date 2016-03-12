program knum;
var a:array[1..10000] of integer;
    i,j,k,n,temp:integer;
begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);
  readln(n,k);
  for i:=1 to n do
      readln(a[i]);
  for i:=1 to n-1 do
      for j:=i+1 to n do
          if a[i]>a[j] then begin temp:=a[i];a[i]:=a[j];a[j]:=temp;end;
  writeln(a[k+1]);
  close(input);
  close(output);
end.