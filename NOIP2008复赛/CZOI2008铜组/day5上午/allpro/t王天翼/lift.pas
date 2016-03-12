var n,a,b,i,k,t,p:longint;
    c:array[1..10000] of integer;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  read(n,a,b);
  for i:=1 to n do
    read(c[i]);
  p:=0;
    for k:=1 to n do
      if a+c[k]=b then inc(p)`5 1 5
      3 3 1 2 5

                  else for i:=k to n do
                          if a+c[i]=b  then inc(p);
  if p=0 then writeln('-1')
         else writeln(p);

  close(input);
  close(output);
end.
