var num,t,s,n,k,i,j:longint;
    a:array[1..100]of longint;
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
    if a[j]>a[i] then
    begin
     t:=a[i];
     a[i]:=a[j];
     a[j]:=t;
    end;
   writeln(a[k]);
  close(input);
  close(output);
end.
