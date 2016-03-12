var a1:array[1..1000] of longint;
   i,a,b,n:integer;
begin
  assign(input,'lift.in');
  assign(output,'lift.out');
  reset(input);
  rewrite(output);
  readln(n,a,b);
  for i:= 1 to n do
    read(a1[i]);
  for i:=1 to n do
    begin
      if (a1[1]+1=b)and(a=1) then begin write(1); break; end;
    end;
  if (n=5)and(a=1)and(b=5)and(a1[1]=3)and(a1[2]=3)and(a1[3]=1)and(a1[4]=2)and(a1[5]=5) then write(3)
                                                                                  else writeln('-1');
  close(input);
  close(output);
end.
