program ex5;
var
  n,wk,i,j:integer;
  w,c:array[0..50] of integer;
  g:array[0..20,0..1000] of integer;
begin
  assign(input,'work5.in');
  reset(input);
  assign(output,'work5.out');
  rewrite(output);

  readln(n,wk);
  for i:=1 to n do
    read(w[i]);
  for i:=1 to n do
    read(c[i]);

  for i:=0 to wk do
    g[0,i]:=0;

  for i:=1 to n do
  begin
    for j:=1 to w[i]-1 do
      g[i,j]:=g[i-1,j];
    for j:=w[i] to wk do
      if (g[i-1,j]>(g[i-1,j-w[i]]+c[i]))
      then g[i,j]:=g[i-1,j]
      else g[i,j]:=g[i-1,j-w[i]]+c[i];
  end;

  writeln(g[n,wk]);

  close(input);
  close(output);
end.
