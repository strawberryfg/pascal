var a:array[1..17]of integer;
    i,n,s:integer;
begin
  assign(input,'prime.in');
  reset(input);
  assign(output,'prime.out');
  rewrite(output);
  read(n);
  for i:=1 to n do
    s:=a[i]+a[i+1];
    if (s mod 2<>0)and(s mod 3<>0)and(s mod 5<>0)and(s mod 7<>0)and(a[i+1]<>a[i]+1)then
                                                                writeln(s);
readln;
close(input);
close(output);
end.